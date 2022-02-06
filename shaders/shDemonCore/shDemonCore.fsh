varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float time;
uniform vec2 resolution;
uniform vec2 demon_core_position;

#define PI 3.14159265359
#define PI2 6.28318530718

const float increase_duration = 5.0;
const float effect_intensity = 0.5;
const float ionization_effect_intensity = 0.5;
const vec3 ionization_color = vec3(0.0, 0.0, 1.0);

vec2 pixel2uv(vec2 px, vec2 res)
{
    vec2 uv = px / res;
    uv.y = 1.0 - uv.y;
    return uv;
}

float circle_repeat(vec2 pos, float rad, vec2 uv)
{
    return mod(distance(pos, uv), rad) / rad;
}

float circle_repeat_hard(vec2 pos, float rad, vec2 uv)
{
    return step(mod(distance(pos, uv), rad) / rad, 0.5);
}

float circle_repeat_soft(vec2 pos, float rad, vec2 uv)
{
    float circle_gradient = mod(distance(pos, uv), rad) / rad;
    return smoothstep(0.0, 0.5, circle_gradient) - smoothstep(0.5, 1.0, circle_gradient);
}

float line_repeat_smooth(vec2 uv, float t)
{
    float line_gradient = mod(uv.x + uv.y, t) / t;
    return smoothstep(0.0, 0.5, line_gradient) - smoothstep(0.5, 1.0, line_gradient);
}

float vec2angle(vec2 v)
{
    return atan(v.x, v.y);
}

vec3 rgb2hsv(vec3 c)
{
    vec4 K = vec4(0.0, -1.0 / 3.0, 2.0 / 3.0, -1.0);
    vec4 p = mix(vec4(c.bg, K.wz), vec4(c.gb, K.xy), step(c.b, c.g));
    vec4 q = mix(vec4(p.xyw, c.r), vec4(c.r, p.yzx), step(p.x, c.r));

    float d = q.x - min(q.w, q.y);
    float e = 1.0e-10;
    return vec3(abs(q.z + (q.w - q.y) / (6.0 * d + e)), d / (q.x + e), q.x);
}

vec3 hsv2rgb(vec3 c)
{
    vec4 K = vec4(1.0, 2.0 / 3.0, 1.0 / 3.0, 3.0);
    vec3 p = abs(fract(c.xxx + K.xyz) * 6.0 - K.www);
    return c.z * mix(K.xxx, clamp(p - K.xxx, 0.0, 1.0), c.y);
}

void main(void)
{
    vec2 uv = v_vTexcoord;
    vec2 dcp = demon_core_position / resolution;
    float t = smoothstep(0.0, increase_duration, time) * effect_intensity;
    float a = vec2angle(uv - dcp);
    float c = circle_repeat_soft(dcp, 0.1 + sin(a * 16.0 + time) * 0.01, uv) * 2.0 - 1.0;
    vec4 img = texture2D(gm_BaseTexture, uv + c * (0.05 - 0.025) * t);
    vec3 hsv = rgb2hsv(img.rgb);
    hsv = vec3(hsv.r, hsv.g * ionization_effect_intensity * (1.0 - t), hsv.b + (1.0 - hsv.b) * ionization_effect_intensity * t);
    img.rgb = hsv2rgb(hsv);
    float l = line_repeat_smooth(uv + time * 0.1 + t, 0.2);
    gl_FragColor = (img + vec4(l * c * t * ionization_color, 1.0)) * v_vColour;
}