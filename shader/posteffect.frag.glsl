precision mediump float;
varying vec4 fs_Col;

uniform int u_Time;
uniform int u_Surrounding;

void main()
{
    vec4 color = vec4(float(u_Time)/5000.0);
//    if(u_Surrounding == 1){
//        fs_Col.b += 0.3;
//    }
//    else if(u_Surrounding == 2){
//        color.r += 0.3;
//    }
//    gl_FragColor = vec4(vec3(float(u_Time)/100.0), 1);
    gl_FragColor = vec4(vec3(float(u_Surrounding)), 1);
}