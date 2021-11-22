precision mediump float;
varying vec4 fs_Col;

uniform int u_Time;
uniform int u_Surrounding;
uniform sampler2D u_RenderedTexture;

void main()
{
    vec4 color = texture2D(u_RenderedTexture, vec2(fs_Col));

    if(u_Surrounding == 1){
        color.b += 0.3;
    }
    else if(u_Surrounding == 2){
        color.r += 0.3;
    }

    gl_FragColor = color;
//    gl_FragColor = vec4(0.4, 0.9, 0.3, 1);
}