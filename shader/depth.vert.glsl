uniform mat4 u_DepthMVP;
uniform mat4 u_Model;
uniform mat4 u_ViewProj;

attribute vec4 vs_Pos;             // The array of vertex positions passed to the shader

attribute vec4 vs_Nor;             // The array of vertex normals passed to the shader

attribute vec4 vs_Col;             // The array of vertex colors passed to the shader.

varying vec4 fs_Pos;
varying vec4 fs_Nor;            // The array of normals that has been transformed by u_ModelInvTr. This is implicitly passed to the fragment shader.
varying vec4 fs_Col;            // The color of each vertex. This is implicitly passed to the fragment shader.


void main()
{
    fs_Pos = u_DepthMVP * u_Model * vs_Pos;
    fs_Col = vs_Col;
    fs_Nor = vs_Nor;
    gl_Position = u_DepthMVP * u_Model * vs_Pos;
    // gl_Position = u_Model * vs_Pos;
    // gl_Position = u_ViewProj * u_Model * vs_Pos;
}