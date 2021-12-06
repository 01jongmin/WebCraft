precision mediump float;

// layout(location = 0) float fragmentdepth;
varying vec4 fs_Pos;
varying vec4 fs_Nor;
varying vec4 fs_LightVec;
varying vec4 fs_Col;

void main() {
    // fragmentdepth = gl_FragCoord.z;
    // gl_FragColor = vec4(vec3(gl_FragCoord.z), 1.0);
    // gl_FragColor = vec4(vec3(fs_Col), 1.0);
    // gl_FragColor = vec4(1.0, 0, gl_FragCoord.z, 1.0);

    gl_FragColor = gl_FragCoord;
    // gl_FragColor = fs_Pos;
}
