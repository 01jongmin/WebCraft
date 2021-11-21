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

extern "C" void EMSCRIPTEN_KEEPALIVE toggle_background_color(int x, int y) {
    dx += x;
    dy += y;
}

#endif

void blockWorkerHandler(std::deque<std::pair<int, int>> &blockWorkerCoordVector,
                        std::mutex &blockWorkermutex,
                        Terrain &m_terrain,
                        std::mutex &vboWorkerMutex,
                        std::deque<Chunk*> &vboChunkVector) {
    while (true) {
//        blockWorkermutex.lock();
//        if (!blockWorkerCoordVector.empty()) {
//            auto &s = blockWorkerCoordVector.at(0);
//            blockWorkerCoordVector.pop_front();
//
//
//            Chunk *c = m_terrain.instantiateChunkAt(s.first, s.second);
//            blockWorkermutex.unlock();
//
//            vboWorkerMutex.lock();
//            vboChunkVector.push_back(c);
//            vboWorkerMutex.unlock();
//        } else {
//            blockWorkermutex.unlock();
//        }
    }
}

void vboWorkerHandler(std::deque<Chunk *> &vboChunkVector,
                      std::mutex &vboWorkerMutex,
                      std::mutex &drawChunkMutex,
                      std::deque<Chunk *> &drawChunkVector) {
    while (true) {
//        vboWorkerMutex.lock();
//
//        if (!vboChunkVector.empty()) {
//            auto &c = vboChunkVector.at(0);
//            vboChunkVector.pop_front();
//
//            c->createVBOdata();
//            vboWorkerMutex.unlock();
//        } else {
//            vboWorkerMutex.unlock();
//        }
    }
}

MyGL::MyGL(SDL_Window *pWindow, std::vector<std::thread> &spawned_threads,
           std::mutex &blockWorkerMutex,
           std::deque<std::pair<int, int>> &blockWorkerCoordVector,
           std::mutex &vboWorkerMutex, std::deque<Chunk *> &vboChunkVector,
           std::mutex &drawChunkMutex,
           std::deque<Chunk *> &drawChunkVector) :
        m_worldAxes(), m_progFlat(), m_terrain(),
        m_progInstanced(), m_progLambert(),
        m_player(glm::vec3(60.f, 200.f, 80.f), m_terrain),
        bundle(InputBundle()),
        lastTick(SDL_GetTicks()),
        spawned_threads(spawned_threads), blockWorkerMutex(blockWorkerMutex),
        blockWorkerCoordVector(blockWorkerCoordVector), vboWorkerMutex(vboWorkerMutex),
        vboChunkVector(vboChunkVector), drawChunkMutex(drawChunkMutex), drawChunkVector(drawChunkVector),
        m_time(0) {

    int k = 0;
    this->window = pWindow;

    SDL_GetWindowSize(window, &(this->width), &(this->height));

    glEnable(GL_DEPTH_TEST);
    glEnable(GL_LINE_SMOOTH);
    glHint(GL_LINE_SMOOTH_HINT, GL_NICEST);
    glEnable(GL_BLEND);
    glBlendFunc(GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA);
    // Set the color with which the screen is filled at the start of each render call.
    glClearColor(0.37f, 0.74f, 1.0f, 1);

    m_progFlat.create("../shader/flat.vert", "../shader/flat.frag");
    m_worldAxes.createVBOdata();
    // Create and set up the diffuse shader
    m_progLambert.create("../shader/lambert.vert.glsl", "../shader/lambert.frag.glsl");

    mp_texture = std::unique_ptr<Texture>(new Texture());
    mp_texture->create("../shader/minecraft_textures_all.png");
    mp_texture->load(0);

    for (int i = 0; i < 20; i++) {
        if (i < 15) {
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

//    int xCurr = 16 * static_cast<int>(glm::floor(pos[0] / 16.f));
//    int zCurr = 16 * static_cast<int>(glm::floor(pos[2] / 16.f));
////
//    int d = 2;
//
//    blockWorkerMutex.lock();
//    vboWorkerMutex.lock();
//
//    bool vectorExhaust = true;
//    if (!blockWorkerCoordVector.empty() || !vboChunkVector.empty()) vectorExhaust = false;
//
//
//    for (int d1 = -d; d1 <= d; d1++) {
//        for (int d2 = -d; d2 <= d; d2++) {
//            int x = xCurr + 16 * d1;
//            int z = zCurr + 16 * d2;
//
//            if (vectorExhaust) {
//                if (!m_terrain.hasChunkAt(x, z)) {
//                    std::cout << "Block worker generating" << std::endl;
//                    blockWorkerCoordVector.push_back(std::pair<int, int>(x, z));
//                } else {
//
//                        if (!m_terrain.getChunkAt(x, z)->vboSet) {
//                            vboChunkVector.push_back(m_terrain.getChunkAt(x, z).get());
//                            std::cout << "VBO generating" << std::endl;
//                        } else {
//                            std::cout << "DRAWING" << std::endl;
//                            m_progLambert.setModelMatrix(glm::translate(glm::mat4(),
//                                                                        glm::vec3(m_terrain.getChunkAt(x, z)->chunkPos.x, 0,
//                                                                                  m_terrain.getChunkAt(x, z)->chunkPos.z)));
//                            m_terrain.getChunkAt(x, z)->setVBOdata();
//                            m_progLambert.drawInterleaved(*m_terrain.getChunkAt(x, z), false);
//                            m_terrain.getChunkAt(x, z)->setTVBOdata();
//                            m_progLambert.drawInterleaved(*m_terrain.getChunkAt(x, z), true);
//                        }
//                }
//            } else {
//                if (m_terrain.hasChunkAt(x, z) && m_terrain.getChunkAt(x, z)->vboSet) {
//                    m_progLambert.setModelMatrix(glm::translate(glm::mat4(),
//                                                                glm::vec3(m_terrain.getChunkAt(x, z)->chunkPos.x, 0,
//                                                                          m_terrain.getChunkAt(x, z)->chunkPos.z)));
//                    m_terrain.getChunkAt(x, z)->setVBOdata();
//                    m_progLambert.drawInterleaved(*m_terrain.getChunkAt(x, z), false);
//                    m_terrain.getChunkAt(x, z)->setTVBOdata();
//                    m_progLambert.drawInterleaved(*m_terrain.getChunkAt(x, z), true);
//                }
//            }
//        }
//    }
//
//    vboWorkerMutex.unlock();
//    blockWorkerMutex.unlock();
//    m_terrain.draw(-128+pos[0], 128+pos[0], -128+pos[2], 128+pos[2], &m_progInstanced);
//    m_terrain.draw();
    int x = 16 * static_cast<int>(glm::floor(pos[0] / 16.f));
    int z = 16 * static_cast<int>(glm::floor(pos[2] / 16.f));
    int d = 32;

    m_terrain.draw(x-d, x+d*2, z-d, z+d*2, &m_progLambert);
}

void MyGL::tick() {
    float rotationAmount = 60;
    m_player.rotateOnRightLocal(-(float) dy / height * rotationAmount);
    m_player.rotateOnUpGlobal(-(float) dx / width * rotationAmount);

    dy = 0;
    dx = 0;

    glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);

    SDL_Event e;

    while (SDL_PollEvent(&e)) {
        switch (e.type) {
            case SDL_MOUSEBUTTONDOWN:
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
    std::cout << curr - lastTick << std::endl;
    m_player.tick((curr - lastTick) / 100.0, bundle);
    lastTick = curr;

    mp_texture->bind(0);
    m_progLambert.setTime(m_time++);

    glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);

    m_progFlat.setViewProjMatrix(m_player.mcr_camera.getViewProj());
    m_progLambert.setViewProjMatrix(m_player.mcr_camera.getViewProj());
    m_progInstanced.setViewProjMatrix(m_player.mcr_camera.getViewProj());

    renderTerrain();

    glDisable(GL_DEPTH_TEST);
    m_progFlat.setModelMatrix(glm::mat4());
    m_progFlat.setViewProjMatrix(m_player.mcr_camera.getViewProj());
    m_progFlat.draw(m_worldAxes);
    glEnable(GL_DEPTH_TEST);
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
            m_player.moveUpGlobal(4);
//            bundle.ePressed = false;
            break;
        case SDLK_q:
            m_player.moveUpGlobal(-4);
//            bundle.qPressed = false;
            break;
    }
}

void MyGL::handleKeyPressDown(SDL_Keycode keyCode) {
    float amount = 2.0f;

    switch (keyCode) {
        case SDLK_w:
            std::cout << "W KeyEvent" << std::endl;
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
            m_player.superMode = !m_player.superMode;
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



