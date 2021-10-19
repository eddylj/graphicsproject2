#version 330 core

uniform mat4 uMVP;

layout (location = 0) in vec4 aPos;
layout (location = 1) in vec2 aTexCoord;

out vec2 vTexCoord;


void main() {
    vTexCoord = aTexCoord;
    gl_Position = uMVP * aPos;
}
