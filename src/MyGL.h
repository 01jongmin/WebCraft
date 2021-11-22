//
// Created by CHOI Jongmin on 11/11/2021.
//

#ifndef WEBCRAFT_MYGL_H
#define WEBCRAFT_MYGL_H

#include <thread>
#include <mutex>
#include "ShaderProgram.h"
#include "WorldAxes.h"
#include "Camera.h"
#include "terrain.h"
#include "player.h"
#include "Texture.h"


class MyGL {

public:
    MyGL(SDL_Window *pWindow, std::vector<std::thread> &spawned_threads,
         std::mutex& blockWorkerMutex, std::deque<std::pair<int, int>>& blockWorkerCoordVector,
         std::mutex& vboWorkerMutex, std::deque<Chunk*>& vboChunkVector, std::mutex &drawChunkMutexes,
         std::deque<Chunk*> &drawChunkVector);

    void tick();

private:
    SDL_Window *window;
    WorldAxes m_worldAxes; // A wireframe representation of the world axes. It is hard-coded to sit centered at (32, 128, 32).

    ShaderProgram m_progLambert;// A shader program that uses lambertian reflection
    ShaderProgram m_progFlat;// A shader program that uses "flat" reflection (no shadowing at all)
    ShaderProgram m_progInstanced;// A shader program that is designed to be compatible with instanced rendering

    int width;
    int height;

    Terrain m_terrain; // All of the Chunks that currently comprise the world.
    Player m_player; // The entity controlled by the user. Contains a camera to display what it sees as well.
    InputBundle bundle;
    int lastTick;

    std::unique_ptr<Texture> mp_texture;

    int m_time;

    std::vector<std::thread>& spawned_threads;

    std::mutex &blockWorkerMutex;
    std::deque<std::pair<int, int>> &blockWorkerCoordVector;

    std::mutex &vboWorkerMutex;
    std::deque<Chunk*> &vboChunkVector;

    std::mutex& drawChunkMutex;
    std::deque<Chunk*>& drawChunkVector;

    void renderTerrain();

    void handleKeyPressDown(SDL_Keycode);
    void handleKeyPressUp(SDL_Keycode);
};


#endif //WEBCRAFT_MYGL_H