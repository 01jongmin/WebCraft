//
// Created by CHOI Jongmin on 11/11/2021.
//

#include <SDL_timer.h>
#include <SDL_events.h>
#include "MyGL.h"
#include "glm_includes.h"
#include "ShaderProgram.h"
#include "Camera.h"
#include <iostream>
#include <chrono>
#include "Texture.h"
#include "chunk.h"

int dx = 0;
int dy = 0;

#ifdef __EMSCRIPTEN__

#include <emscripten.h>
extern "C" void EMSCRIPTEN_KEEPALIVE handle_mouse_move(int x, int y) {
    dx += x;
    dy += y;
}
#endif

void blockWorkerHandler(std::deque<std::pair<int, int>> &blockWorkerCoordVector,
                        std::mutex &blockWorkermutex,
                        Terrain &m_terrain,
                        std::mutex &vboWorkerMutex,
                        std::deque<Chunk *> &vboChunkVector) {
    while (true) {
        blockWorkermutex.lock();
        if (!blockWorkerCoordVector.empty()) {
            auto &s = blockWorkerCoordVector.at(0);
            blockWorkerCoordVector.pop_front();
            Chunk *c = m_terrain.instantiateChunkAt(s.first, s.second);
            blockWorkermutex.unlock();

            vboWorkerMutex.lock();
            vboChunkVector.push_back(c);
            vboWorkerMutex.unlock();
        } else {
            blockWorkermutex.unlock();
        }
        std::this_thread::sleep_for(std::chrono::milliseconds(16));
    }
}

void vboWorkerHandler(std::deque<Chunk *> &vboChunkVector,
                      std::mutex &vboWorkerMutex,
                      std::mutex &drawChunkMutex,
                      std::deque<Chunk *> &drawChunkVector) {
    while (true) {
        vboWorkerMutex.lock();

        if (!vboChunkVector.empty()) {
            auto &c = vboChunkVector.at(0);
            vboChunkVector.pop_front();

            c->createVBOdata();
            vboWorkerMutex.unlock();
        } else {
            vboWorkerMutex.unlock();
        }
        std::this_thread::sleep_for(std::chrono::milliseconds(16));
    }
}

MyGL::MyGL(SDL_Window *pWindow, std::vector<std::thread> &spawned_threads,
           std::mutex &blockWorkerMutex,
           std::deque<std::pair<int, int>> &blockWorkerCoordVector,
           std::mutex &vboWorkerMutex, std::deque<Chunk *> &vboChunkVector,
           std::mutex &drawChunkMutex,
           std::deque<Chunk *> &drawChunkVector) :
        m_worldAxes(), m_progFlat(), m_terrain(),
        m_progLambert(), m_progPostprocess(),
        m_player(glm::vec3(60.f, 140.f, 80.f), m_terrain),
        bundle(InputBundle()),
        lastTick(SDL_GetTicks()),
        spawned_threads(spawned_threads), blockWorkerMutex(blockWorkerMutex),
        blockWorkerCoordVector(blockWorkerCoordVector), vboWorkerMutex(vboWorkerMutex),
        vboChunkVector(vboChunkVector), drawChunkMutex(drawChunkMutex), drawChunkVector(drawChunkVector),
        m_time(0), m_geomQuad(), m_frameBuffer() {

    int k = 0;
    this->window = pWindow;

    SDL_GetWindowSize(window, &(this->width), &(this->height));
    m_frameBuffer.setDimensions(width, height);
    m_frameBuffer.create();

    glEnable(GL_DEPTH_TEST);
    glEnable(GL_LINE_SMOOTH);
    glHint(GL_LINE_SMOOTH_HINT, GL_NICEST);
    glEnable(GL_BLEND);
    glBlendFunc(GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA);

    // Set the color with which the screen is filled at the start of each render call.
    glClearColor(0.37f, 0.74f, 1.0f, 1);

    m_progFlat.create("../shader/flat.vert", "../shader/flat.frag");
    m_progLambert.create("../shader/lambert.vert.glsl", "../shader/lambert.frag.glsl");
    m_progPostprocess.create("../shader/passthrough.vert.glsl", "../shader/posteffect.frag.glsl");

    m_worldAxes.createVBOdata();
    m_geomQuad.createVBOdata();

    mp_texture = std::unique_ptr<Texture>(new Texture());
    mp_texture->create("../shader/minecraft_textures_all.png");
    mp_texture->load(0);

    for (int i = 0; i < 8; i++) {
        if (i < 6) {
            spawned_threads.push_back(std::thread(std::ref(blockWorkerHandler),
                                                  std::ref(blockWorkerCoordVector),
                                                  std::ref(blockWorkerMutex),
                                                  std::ref(m_terrain),
                                                  std::ref(vboWorkerMutex),
                                                  std::ref(vboChunkVector)));
        } else {
            spawned_threads.push_back(std::thread(std::ref(vboWorkerHandler),
                                                  std::ref(vboChunkVector),
                                                  std::ref(vboWorkerMutex),
                                                  std::ref(drawChunkMutex),
                                                  std::ref(drawChunkVector)));
        }
    }
}

void MyGL::renderTerrain() {
    glm::vec3 pos = m_player.mcr_camera.mcr_position;

    int xCurr = 16 * static_cast<int>(glm::floor(pos[0] / 16.f));
    int zCurr = 16 * static_cast<int>(glm::floor(pos[2] / 16.f));

    int d = 10;

    blockWorkerMutex.lock();
    vboWorkerMutex.lock();
    blockWorkerCoordVector.clear();
    vboChunkVector.clear();

    for (int d1 = -d; d1 <= d; d1++) {
        for (int d2 = -d; d2 <= d; d2++) {
            int x = xCurr + 16 * d1;
            int z = zCurr + 16 * d2;

            if (!m_terrain.hasChunkAt(x, z)) {
                blockWorkerCoordVector.push_back(std::pair<int, int>(x, z));
            } else if (!m_terrain.getChunkAt(x, z)->vboSet && std::abs(d1) <= d - 1 && std::abs(d2) <= d - 1) {
                vboChunkVector.push_back(m_terrain.getChunkAt(x, z).get());
            } else if (m_terrain.getChunkAt(x, z)->needUpdate && std::abs(d1) <= d - 1 && std::abs(d2) <= d - 1) {
                vboChunkVector.push_back(m_terrain.getChunkAt(x, z).get());
                drawChunkVector.push_back(m_terrain.getChunkAt(x, z).get());
                m_progLambert.setModelMatrix(glm::translate(glm::mat4(),
                                                            glm::vec3(m_terrain.getChunkAt(x, z)->chunkPos.x, 0,
                                                                      m_terrain.getChunkAt(x, z)->chunkPos.z)));
                m_terrain.getChunkAt(x, z)->setVBOdata();
                m_progLambert.drawChunkInterleaved(*m_terrain.getChunkAt(x, z), false);
                drawChunkVector.push_back(m_terrain.getChunkAt(x, z).get());
            } else if (std::abs(d1) <= d / 2 && std::abs(d2) <= d / 2) {
                m_progLambert.setModelMatrix(glm::translate(glm::mat4(),
                                                            glm::vec3(m_terrain.getChunkAt(x, z)->chunkPos.x, 0,
                                                                      m_terrain.getChunkAt(x, z)->chunkPos.z)));
                m_terrain.getChunkAt(x, z)->setVBOdata();
                m_progLambert.drawChunkInterleaved(*m_terrain.getChunkAt(x, z), false);
                drawChunkVector.push_back(m_terrain.getChunkAt(x, z).get());
            }
        }
    }

    for (auto c : drawChunkVector) {
        m_progLambert.setModelMatrix(glm::translate(glm::mat4(),
                                                    glm::vec3(c->chunkPos.x, 0,
                                                              c->chunkPos.z)));
        c->setTVBOdata();
        m_progLambert.drawChunkInterleaved(*c, true);
    }

    drawChunkVector.clear();

    vboWorkerMutex.unlock();
    blockWorkerMutex.unlock();
}

void MyGL::tick() {
    float rotationAmount = 60;
    m_player.rotateOnRightLocal(-(float) dy / height * rotationAmount);
    m_player.rotateOnUpGlobal(-(float) dx / width * rotationAmount);

    dy = 0;
    dx = 0;

    m_frameBuffer.bindFrameBuffer();

    glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);

    SDL_Event e;

    while (SDL_PollEvent(&e)) {
        switch (e.type) {
            case SDL_MOUSEBUTTONDOWN:
                switch(e.button.button) {
                    case SDL_BUTTON_LEFT:
                        m_player.deleteBlock(&m_terrain);
                        break;
                    case SDL_BUTTON_RIGHT:
                        m_player.addBlock(&m_terrain);
                        break;
                    default:
                        break;
                }
                break;
            case SDL_KEYDOWN:
                handleKeyPressDown(e.key.keysym.sym);
                break;
            case SDL_KEYUP:
                handleKeyPressUp(e.key.keysym.sym);
                break;
            case SDL_QUIT:
                break;
            default:
                break;
        }
    }

    int curr = SDL_GetTicks();
    m_player.tick((curr - lastTick) / 100.0, bundle);
    lastTick = curr;

    mp_texture->bind(0);

    int temp = m_time++;
    m_progLambert.setTime(temp);

    glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);

    m_progFlat.setViewProjMatrix(m_player.mcr_camera.getViewProj());
    m_progLambert.setViewProjMatrix(m_player.mcr_camera.getViewProj());
    m_progPostprocess.setViewProjMatrix(m_player.mcr_camera.getViewProj());

    renderTerrain();

    glDisable(GL_DEPTH_TEST);
    m_progFlat.setModelMatrix(glm::mat4());
    m_progFlat.setViewProjMatrix(m_player.mcr_camera.getViewProj());
    m_progFlat.draw(m_worldAxes);
    glEnable(GL_DEPTH_TEST);

    glBindFramebuffer(GL_FRAMEBUFFER, 0);
    m_frameBuffer.bindToTextureSlot(2);

    glm::vec3 pos = m_player.mcr_camera.mcr_position;

    if(m_terrain.getBlockAt(pos) == WATER)
        m_progPostprocess.setSurrounding(1);
    else if(m_terrain.getBlockAt(pos) == LAVA)
        m_progPostprocess.setSurrounding(2);
    else
        m_progPostprocess.setSurrounding(0);

    m_progPostprocess.draw(m_geomQuad, 2);
}

void MyGL::handleKeyPressUp(SDL_Keycode keyCode) {
    switch (keyCode) {
        case SDLK_w:
            bundle.wPressed = false;
            break;
        case SDLK_a:
            bundle.aPressed = false;
            break;
        case SDLK_s:
            bundle.sPressed = false;
            break;
        case SDLK_d:
            bundle.dPressed = false;
            break;
        case SDLK_SPACE:
            bundle.spacePressed = false;
            break;
        case SDLK_e:
            bundle.ePressed = false;
            break;
        case SDLK_q:
            bundle.qPressed = false;
            break;
    }
}

void MyGL::handleKeyPressDown(SDL_Keycode keyCode) {
    float amount = 2.0f;

    switch (keyCode) {
        case SDLK_w:
            bundle.wPressed = true;
            break;
        case SDLK_a:
            bundle.aPressed = true;
            break;
        case SDLK_s:
            bundle.sPressed = true;
            break;
        case SDLK_d:
            bundle.dPressed = true;
            break;
        case SDLK_SPACE:
            bundle.spacePressed = true;
            break;
        case SDLK_e:
            bundle.ePressed = true;
            break;
        case SDLK_q:
            bundle.qPressed = true;
            break;
        case SDLK_f:
            m_player.toggleSuper();
            break;
        case SDLK_LEFT:
            m_player.rotateOnUpGlobal(amount);
            break;
        case SDLK_RIGHT:
            m_player.rotateOnUpGlobal(-amount);
            break;
        case SDLK_UP:
            m_player.rotateOnRightLocal(amount);
            break;
        case SDLK_DOWN:
            m_player.rotateOnRightLocal(-amount);
            break;
        default:
            break;
    }
}



