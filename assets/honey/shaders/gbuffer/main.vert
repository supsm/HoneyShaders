#include frex:shaders/api/vertex.glsl

out float diffuse;

void frx_pipelineVertex() {
    if (frx_modelOriginType() == MODEL_ORIGIN_SCREEN) {
        gl_Position = frx_guiViewProjectionMatrix() * frx_vertex;
    } else {
        frx_vertex += frx_modelToCamera();
        gl_Position = frx_viewProjectionMatrix() * frx_vertex;
    }

    float lightSource = dot(frx_vertexNormal.rgb, frx_skyLightVector + vec3(0.2, 0.3, 0.4));
    lightSource = lightSource * 0.5 + 0.5; //normalize
    diffuse = lightSource * 0.5 + 0.5;
}