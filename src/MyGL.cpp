//
// Created by CHOI Jongmin on 11/11/2021.
//

#include <SDL_timer.h>
#include <SDL_events.h>
#include <GLES2/gl2.h>
#include <vector>
#include "MyGL.h"
#include "glm_includes.h"
#include "ShaderProgram.h"
#include "Camera.h"
#include <iostream>

int dx = 0;
int dy = 0;

#ifdef __EMSCRIPTEN__
#include <emscripten.h>

extern "C" void EMSCRIPTEN_KEEPALIVE toggle_background_color(int x, int y) {
    dx += x;
    dy += y;
}
#endif

MyGL::MyGL(SDL_Window *pWindow):
        m_worldAxes(), m_progFlat(), m_terrain(),
        m_progInstanced(), m_progLambert(),
        m_player(glm::vec3(20.f, 180.f, 20.f), m_terrain)
//        m_player(glm::vec3(32, 129, 40), m_terrain)
        {

    this->window = pWindow;

    SDL_GetWindowSize(window, &(this->width), &(this->height));

    glEnable(GL_DEPTH_TEST);
    glEnable(GL_LINE_SMOOTH);
    glHint(GL_LINE_SMOOTH_HINT, GL_NICEST);
    // Set the color with which the screen is filled at the start of each render call.
    glClearColor(0.37f, 0.74f, 1.0f, 1);

    m_progFlat.create("../shader/flat.vert", "../shader/flat.frag");
    m_worldAxes.createVBOdata();
//
    //Create the instance of the world axes
//    m_worldAxes.createVBOdata();

    // Create and set up the diffuse shader
    m_progLambert.create("../shader/lambert.vert.glsl", "../shader/lambert.frag.glsl");
    // Create and set up the flat lighting shader
//    m_progFlat.create("../shader/flat.vert", "../shader/flat.frag");
//    m_progInstanced.create("../shader/instanced.vert.glsl", "../shader/lambert.frag.glsl");

    // Set a color with which to draw geometry.
    // This will ultimately not be used when you change
    // your program to render Chunks with vertex colors
    // and UV coordinates
//    m_progLambert.setGeometryColor(glm::vec4(0,1,0,1));
}


void MyGL::renderTerrain() {
    glm::vec3 pos = m_player.mcr_camera.mcr_position;
    int x = 16 * static_cast<int>(glm::floor(pos[0] / 16.f));
    int z = 16 * static_cast<int>(glm::floor(pos[2] / 16.f));
    int d = 48;

    m_terrain.draw(x-d, x+d*2, z-d, z+d*2, &m_progLambert);
}


void MyGL::tick() {
    float rotationAmount = 60;
    m_player.rotateOnRightLocal(-(float) dy/height * rotationAmount);
    m_player.rotateOnUpGlobal(-(float) dx/width * rotationAmount);

    dy = 0;
    dx = 0;

    glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);

    SDL_Event e;

    while (SDL_PollEvent(&e)) {
        switch (e.type) {
            case SDL_MOUSEBUTTONDOWN:
                std::cout << "Mouse event" << std::endl;
                break;
            case SDL_KEYDOWN:
                handleKeyPressDown(e.key.keysym.sym);
            case SDL_QUIT:
                break;
            default:
                break;
        }
    }

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

void MyGL::handleKeyPressDown(SDL_Keycode keyCode) {
    float amount = 2.0f;

    switch (keyCode) {
        case SDLK_w:
            m_player.moveForwardLocal(amount);
        break;
        case SDLK_a:
            m_player.moveRightLocal(-amount);
        break;
        case SDLK_s:
            m_player.moveForwardLocal(-amount);
        break;
        case SDLK_d:
            m_player.moveRightLocal(amount);
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

