#include "chunk.h"
#include "GLES2/gl2.h"

Chunk::Chunk():
    Drawable(),
    m_blocks(),
    m_neighbors{
        {XPOS, nullptr},
        {XNEG, nullptr},
        {ZPOS, nullptr},
        {ZNEG, nullptr},
    } {
    std::fill_n(m_blocks.begin(), 65536, EMPTY);
}

void Chunk::createVBOdata() {
    std::vector<glm::vec4> pos {};
    std::vector<glm::vec4> nor {};
    std::vector<glm::vec4> col {};
    data.clear();
    idx.clear();

    for (int x = 0; x < 16; x++) {
        for (int y = 0; y < 256; y++) {
            for (int z = 0; z < 16; z++) {
                if (getBlockAt(x, y, z) != EMPTY) {
                    uPtr<std::unordered_map<Direction, BlockType, EnumHash>> localNeighbors = getLocalNeighbors(x, y, z);
                    for (auto neighbors : *localNeighbors.get()) {
                        if (neighbors.second == EMPTY) {
                            drawFace(neighbors.first,
                                     &pos,
                                     &nor,
                                     &col,
                                     &idx,
                                     glm::vec4(x, y, z, 0), getBlockAt(x, y, z));
                        }
                    }
                }
            }
        }
    }
    for (int i = 0; i < (int) pos.size(); i++) {
        data.push_back(pos[i]);
        data.push_back(nor[i]);
        data.push_back(col[i]);
    }
}

void Chunk::setVBOdata() {
    m_count = idx.size();

    // Create a VBO on our GPU and store its handle in bufIdx
    generateIdx();
    glBindBuffer(GL_ELEMENT_ARRAY_BUFFER, m_bufIdx);
    glBufferData(GL_ELEMENT_ARRAY_BUFFER, idx.size() * sizeof(GLuint), idx.data(), GL_STATIC_DRAW);

    generatePos();
    glBindBuffer(GL_ARRAY_BUFFER, m_bufPos);
    glBufferData(GL_ARRAY_BUFFER, data.size() * sizeof(glm::vec4), data.data(), GL_STATIC_DRAW);
}

void Chunk::drawFace(
        Direction direction,
        std::vector<glm::vec4>* pos,
        std::vector<glm::vec4>* nor,
        std::vector<glm::vec4>* col,
        std::vector<GLuint>* idx,
        glm::vec4 blockPos,
        BlockType blockType) {

    int originalPosSize = pos->size();

    switch(direction) {
    case(XPOS):
        pos->push_back(glm::vec4(1.0f, 1.0f, 0.0f, 1.0f) + blockPos);
        pos->push_back(glm::vec4(1.0f, 0.0f, 0.0f, 1.0f) + blockPos);
        pos->push_back(glm::vec4(1.0f, 0.0f, 1.0f, 1.0f) + blockPos);
        pos->push_back(glm::vec4(1.0f, 1.0f, 1.0f, 1.0f) + blockPos);

        for(int i = 0; i < 4; i ++) {
            nor->push_back(glm::vec4(1, 0, 0, 0));
        }
        break;
    case(XNEG):
        pos->push_back(glm::vec4(0.0f, 1.0f, 0.0f, 1.0f) + blockPos);
        pos->push_back(glm::vec4(0.0f, 0.0f, 0.0f, 1.0f) + blockPos);
        pos->push_back(glm::vec4(0.0f, 0.0f, 1.0f, 1.0f) + blockPos);
        pos->push_back(glm::vec4(0.0f, 1.0f, 1.0f, 1.0f) + blockPos);

        for(int i = 0; i < 4; i ++) {
            nor->push_back(glm::vec4(-1, 0, 0, 0));
        }
        break;
    case(YPOS):
        pos->push_back(glm::vec4(1.0f, 1.0f, 0.0f, 1.0f) + blockPos);
        pos->push_back(glm::vec4(0.0f, 1.0f, 0.0f, 1.0f) + blockPos);
        pos->push_back(glm::vec4(0.0f, 1.0f, 1.0f, 1.0f) + blockPos);
        pos->push_back(glm::vec4(1.0f, 1.0f, 1.0f, 1.0f) + blockPos);

        for(int i = 0; i < 4; i ++) {
            nor->push_back(glm::vec4(0, 1, 0, 0));
        }
        break;
    case(YNEG):
        pos->push_back(glm::vec4(1.0f, 0.0f, 0.0f, 1.0f) + blockPos);
        pos->push_back(glm::vec4(0.0f, 0.0f, 0.0f, 1.0f) + blockPos);
        pos->push_back(glm::vec4(0.0f, 0.0f, 1.0f, 1.0f) + blockPos);
        pos->push_back(glm::vec4(1.0f, 0.0f, 1.0f, 1.0f) + blockPos);

        for(int i = 0; i < 4; i ++) {
            nor->push_back(glm::vec4(0, -1, 0, 0));
        }
        break;
    case(ZPOS):
        pos->push_back(glm::vec4(1.0f, 0.0f, 1.0f, 1.0f) + blockPos);
        pos->push_back(glm::vec4(0.0f, 0.0f, 1.0f, 1.0f) + blockPos);
        pos->push_back(glm::vec4(0.0f, 1.0f, 1.0f, 1.0f) + blockPos);
        pos->push_back(glm::vec4(1.0f, 1.0f, 1.0f, 1.0f) + blockPos);

        for(int i = 0; i < 4; i ++) {
            nor->push_back(glm::vec4(0, 0, 1, 0));
        }
        break;
    case(ZNEG):
        pos->push_back(glm::vec4(1.0f, 0.0f, 0.0f, 1.0f) + blockPos);
        pos->push_back(glm::vec4(0.0f, 0.0f, 0.0f, 1.0f) + blockPos);
        pos->push_back(glm::vec4(0.0f, 1.0f, 0.0f, 1.0f) + blockPos);
        pos->push_back(glm::vec4(1.0f, 1.0f, 0.0f, 1.0f) + blockPos);

        for(int i = 0; i < 4; i ++) {
            nor->push_back(glm::vec4(0, 0, -1, 0));
        }
        break;
    }

    // fill idx buffer to make square
    idx->push_back(0 + originalPosSize);
    idx->push_back(1 + originalPosSize);
    idx->push_back(2 + originalPosSize);
    idx->push_back(0 + originalPosSize);
    idx->push_back(2 + originalPosSize);
    idx->push_back(3 + originalPosSize);

    // fill color
    for(int i = 0; i < 4; i ++) {
        col->push_back(getColor(blockType));
    }
}

glm::vec4 Chunk::getColor(BlockType blockType) {
    switch(blockType) {
    case GRASS:
        return glm::vec4(95.f, 159.f, 53.f, 0.f) / 255.f;
        break;
    case DIRT:
        return glm::vec4(121.f, 85.f, 58.f, 0.f) / 255.f;
        break;
    case STONE:
        return glm::vec4(0.5f, 0.5f, 0.5f, 0.f);
        break;
    case WATER:
        return glm::vec4(0.f, 0.f, 0.75f, 0.f);
        break;
    case SNOW:
        return glm::vec4(0.9f, 0.9f, 0.9f, 0.f);
        break;
    default:
        // Other block types are not yet handled, so we default to debug purple
        return glm::vec4(1.f, 0.f, 1.f, 0.f);
        break;
    }
}

// Exists to get rid of compiler warnings about int -> unsigned int implicit conversion
BlockType Chunk::getBlockAt(int x, int y, int z) const {
    if (x >= 0 && x < 16 && y >= 0 && y < 256 && z >= 0 && z < 16)
        return m_blocks.at(x + 16 * y + 16 * 256 * z);
    else {
        if (x < 0 && m_neighbors.at(XNEG) != nullptr) {
            return m_neighbors.at(XNEG)->getBlockAt(static_cast<unsigned int>(15), y, z);
        } else if (x >= 16 && m_neighbors.at(XPOS) != nullptr) {
            return m_neighbors.at(XPOS)->getBlockAt(static_cast<unsigned int>(0), y, z);
        } else if (z < 0 && m_neighbors.at(ZNEG) != nullptr) {
            return m_neighbors.at(ZNEG)->getBlockAt(x, y, static_cast<unsigned int>(15));
        } else if (z >= 16 && m_neighbors.at(ZPOS) != nullptr) {
            return m_neighbors.at(ZPOS)->getBlockAt(x, y, static_cast<unsigned int>(0));
        } else {
            return EMPTY;
        }
    }
}

// Does bounds checking with at()
void Chunk::setBlockAt(unsigned int x, unsigned int y, unsigned int z, BlockType t) {
    m_blocks.at(x + 16 * y + 16 * 256 * z) = t;
}


const static std::unordered_map<Direction, Direction, EnumHash> oppositeDirection {
    {XPOS, XNEG},
    {XNEG, XPOS},
    {YPOS, YNEG},
    {YNEG, YPOS},
    {ZPOS, ZNEG},
    {ZNEG, ZPOS}
};

void Chunk::linkNeighbor(uPtr<Chunk> &neighbor, Direction dir) {
    if(neighbor != nullptr) {
        this->m_neighbors[dir] = neighbor.get();
        neighbor->m_neighbors[oppositeDirection.at(dir)] = this;
    }
}

uPtr<std::unordered_map<Direction, BlockType, EnumHash>> Chunk::getLocalNeighbors(int x, int y, int z) {
    std::unordered_map<Direction, BlockType, EnumHash> localNeighbors = {};
    localNeighbors[XPOS] = getBlockAt(x + 1, y, z);
    localNeighbors[XNEG] = getBlockAt(x - 1, y, z);
    localNeighbors[YPOS] = getBlockAt(x, y + 1, z);
    localNeighbors[YNEG] = getBlockAt(x, y - 1, z);
    localNeighbors[ZPOS] = getBlockAt(x, y, z + 1);
    localNeighbors[ZNEG] = getBlockAt(x, y, z - 1);
    return mkU<std::unordered_map<Direction, BlockType, EnumHash>>(localNeighbors);
}
