//
// Created by CHOI Jongmin on 13/11/2021.
//

#include <fstream>
#include <iostream>
#include <GLES2/gl2.h>
#include "ShaderProgram.h"

ShaderProgram::ShaderProgram()
        : vertShader(), fragShader(), prog(),
          attrPos(-1), attrNor(-1), attrCol(-1),
          unifModel(-1), unifModelInvTr(-1), unifViewProj(-1), unifColor(-1)
{}

void ShaderProgram::create(const char *vertfile, const char *fragfile)
{
    char* vertSource = textFileRead(vertfile);
    char* fragSource = textFileRead(fragfile);

    // Allocate space on our GPU for a vertex shader and a fragment shader and a shader program to manage the two
    vertShader = glCreateShader(GL_VERTEX_SHADER);
    glShaderSource(vertShader, 1, (const char**)&vertSource, nullptr);
    glCompileShader(vertShader);

    fragShader = glCreateShader(GL_FRAGMENT_SHADER);
    glShaderSource(fragShader, 1, (const char**)&fragSource, nullptr);
    glCompileShader(fragShader);

    prog = glCreateProgram();
    glAttachShader(prog, vertShader);
    glAttachShader(prog, fragShader);
    glLinkProgram(prog);

    attrPos = glGetAttribLocation(prog, "vs_Pos");
    attrNor = glGetAttribLocation(prog, "vs_Nor");
    attrCol = glGetAttribLocation(prog, "vs_Col");
    if(attrCol == -1) attrCol = glGetAttribLocation(prog, "vs_ColInstanced");
    attrPosOffset = glGetAttribLocation(prog, "vs_OffsetInstanced");

    unifModel      = glGetUniformLocation(prog, "u_Model");
    unifModelInvTr = glGetUniformLocation(prog, "u_ModelInvTr");
    unifViewProj   = glGetUniformLocation(prog, "u_ViewProj");
    unifColor      = glGetUniformLocation(prog, "u_Color");
}

void ShaderProgram::useMe() {
    glUseProgram(prog);
}

void ShaderProgram::setModelMatrix(const glm::mat4 &model)
{
    useMe();

    if (unifModel != -1) {
        glUniformMatrix4fv(unifModel, 1, GL_FALSE,&model[0][0]);
    }

    if (unifModelInvTr != -1) {
        glm::mat4 modelinvtr = glm::inverse(glm::transpose(model));
        // Pass a 4x4 matrix into a uniform variable in our shader
        // Handle to the matrix variable on the GPU
        glUniformMatrix4fv(unifModelInvTr, 1, GL_FALSE, &modelinvtr[0][0]);
    }
}

void ShaderProgram::setViewProjMatrix(const glm::mat4 &vp)
{
    // Tell OpenGL to use this shader program for subsequent function calls
    useMe();

    if(unifViewProj != -1) {
        // Pass a 4x4 matrix into a uniform variable in our shader
        // Handle to the matrix variable on the GPU
        glUniformMatrix4fv(unifViewProj,1, GL_FALSE,&vp[0][0]);
    }
}

void ShaderProgram::draw(Drawable &d)
{
    useMe();

    if(d.elemCount() < 0) {
        throw std::out_of_range("Attempting to draw a drawable with m_count of " + std::to_string(d.elemCount()) + "!");
    }

    // Each of the following blocks checks that:
    //   * This shader has this attribute, and
    //   * This Drawable has a vertex buffer for this attribute.
    // If so, it binds the appropriate buffers to each attribute.

    // Remember, by calling bindPos(), we call
    // glBindBuffer on the Drawable's VBO for vertex position,
    // meaning that glVertexAttribPointer associates vs_Pos
    // (referred to by attrPos) with that VBO
    if (attrPos != -1 && d.bindPos()) {
        glEnableVertexAttribArray(attrPos);
        glVertexAttribPointer(attrPos, 4, GL_FLOAT, false, 0, NULL);
    }

    if (attrNor != -1 && d.bindNor()) {
        glEnableVertexAttribArray(attrNor);
        glVertexAttribPointer(attrNor, 4, GL_FLOAT, false, 0, NULL);
    }

    if (attrCol != -1 && d.bindCol()) {
        glEnableVertexAttribArray(attrCol);
        glVertexAttribPointer(attrCol, 4, GL_FLOAT, false, 0, NULL);
    }

    // Bind the index buffer and then draw shapes from it.
    // This invokes the shader program, which accesses the vertex buffers.
    d.bindIdx();
    glDrawElements(d.drawMode(), d.elemCount(), GL_UNSIGNED_INT, 0);

    if (attrPos != -1) glDisableVertexAttribArray(attrPos);
    if (attrNor != -1) glDisableVertexAttribArray(attrNor);
    if (attrCol != -1) glDisableVertexAttribArray(attrCol);

    GLenum error = glGetError();
    if (error != GL_NO_ERROR) {
        std::cerr << "OpenGL error " << error << ": ";
        const char *e =
                error == GL_INVALID_OPERATION             ? "GL_INVALID_OPERATION" :
                error == GL_INVALID_ENUM                  ? "GL_INVALID_ENUM" :
                error == GL_INVALID_VALUE                 ? "GL_INVALID_VALUE" :
                error == GL_INVALID_INDEX                 ? "GL_INVALID_INDEX" :
                error == GL_INVALID_OPERATION             ? "GL_INVALID_OPERATION" : "?";
        std::cerr << e << std::endl;
    }
}

void ShaderProgram::drawInterleaved(Drawable &d)
{
    useMe();

    if(d.elemCount() < 0) {
        throw std::out_of_range("Attempting to draw a drawable with m_count of " + std::to_string(d.elemCount()) + "!");
    }

    // Each of the following blocks checks that:
    //   * This shader has this attribute, and
    //   * This Drawable has a vertex buffer for this attribute.
    // If so, it binds the appropriate buffers to each attribute.

    // Remember, by calling bindPos(), we call
    // glBindBuffer on the Drawable's VBO for vertex position,
    // meaning that glVertexAttribPointer associates vs_Pos
    // (referred to by attrPos) with that VBO
    if (attrPos != -1 && d.bindPos()) {
        glEnableVertexAttribArray(attrPos);
        glVertexAttribPointer(attrPos, 4, GL_FLOAT, false, 3 * sizeof(glm::vec4), (void*)0);

        glEnableVertexAttribArray(attrNor);
        glVertexAttribPointer(attrNor, 4, GL_FLOAT, false, 3 * sizeof(glm::vec4), (void*) sizeof(glm::vec4));

        glEnableVertexAttribArray(attrCol);
        glVertexAttribPointer(attrCol, 4, GL_FLOAT, false, 3 * sizeof(glm::vec4), (void*) (2 * sizeof(glm::vec4)));
    }

    // Bind the index buffer and then draw shapes from it.
    // This invokes the shader program, which accesses the vertex buffers.
    d.bindIdx();
    glDrawElements(d.drawMode(), d.elemCount(), GL_UNSIGNED_INT, 0);

    if (attrPos != -1) glDisableVertexAttribArray(attrPos);
}

char* ShaderProgram::textFileRead(const char* fileName) {
    char* text;

    if (fileName != NULL) {
        FILE *file = fopen(fileName, "rt");

        if (file != NULL) {
            fseek(file, 0, SEEK_END);
            int count = ftell(file);
            rewind(file);

            if (count > 0) {
                text = (char*)malloc(sizeof(char) * (count + 1));
                count = fread(text, sizeof(char), count, file);
                text[count] = '\0';	//cap off the string with a terminal symbol, fixed by Cory
            }
            fclose(file);
        } else {
            std::cout << "ERROR" << std::endl;
        }
    }

    return text;
}