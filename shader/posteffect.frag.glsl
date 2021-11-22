#version 120

varying vec2 fs_Col;

uniform sampler2D u_Texture;
uniform int u_Time;

void main()
{
    color = texture(u_RenderedTexture, fs_UV).rgb;

    if(u_Surrounding == 1){
        color.b += 0.3;
    }
    else if(u_Surrounding == 2){
        color.r += 0.3;
    }
}

void main() {

}
