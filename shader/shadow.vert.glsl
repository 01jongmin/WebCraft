uniform mat4 u_Model;       // The matrix that defines the transformation of the
                            // object we're rendering. In this assignment,
                            // this will be the result of traversing your scene graph.
uniform mat4 u_DepthMVP;

uniform mat4 u_ModelInvTr;  // The inverse transpose of the model matrix.
                            // This allows us to transform the object's normals properly
                            // if the object has been non-uniformly scaled.

uniform mat4 u_ViewProj;    // The matrix that defines the camera's transformation.
                            // We've written a static matrix for you to use for HW2,
                            // but in HW3 you'll have to generate one yourself
//
//uniform vec4 u_Color;       // When drawing the cube instance, we'll set our uniform color to represent different block types.
//
attribute vec4 vs_Pos;             // The array of vertex positions passed to the shader

attribute vec4 vs_Nor;             // The array of vertex normals passed to the shader

attribute vec4 vs_Col;             // The array of vertex colors passed to the shader.

varying vec4 fs_Pos;
varying vec4 fs_Nor;            // The array of normals that has been transformed by u_ModelInvTr. This is implicitly passed to the fragment shader.
varying vec4 fs_LightVec;       // The direction in which our virtual light lies, relative to each vertex. This is implicitly passed to the fragment shader.
varying vec4 fs_Col;            // The color of each vertex. This is implicitly passed to the fragment shader.

const vec4 lightDir = normalize(vec4(0.5, 1, 0.75, 0.0));  // The direction of our virtual light, which is used to compute the shading of
                                        // the geometry in the fragment shader.

void main() {
    fs_Pos = vs_Pos;
    //fs_Col = u_Color;                         // Pass the vertex colors to the fragment shader for interpolation
    fs_Col = vs_Col;

    mat3 invTranspose = mat3(u_ModelInvTr);
    fs_Nor = vec4(invTranspose * vec3(vs_Nor), 0);          // Pass the vertex normals to the fragment shader for interpolation.
    // Transform the geometry's normals by the inverse transpose of the
    // model matrix. This is necessary to ensure the normals remain
    // perpendicular to the surface after the surface is transformed by
    // the model matrix.


    vec4 modelposition = u_Model * vs_Pos;   // Temporarily store the transformed vertex positions for use below

    if (fs_Col.z == 0.0) {
        fs_LightVec = u_DepthMVP * u_Model * vs_Pos;
    } else {
        fs_LightVec = vec4(0.0, 0.0, 0.0, 0.0);
    }

    gl_Position = u_ViewProj * modelposition;// gl_Position is a built-in variable of OpenGL which is
    // used to render the final positions of the geometry's vertices
}