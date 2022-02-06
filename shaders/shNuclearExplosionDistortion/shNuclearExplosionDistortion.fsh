varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float time;
uniform vec2 resolution;

float rand(vec2 co){
    return fract(sin(dot(co, vec2(12.9898, 78.233))) * 43758.5453);
}

vec3 hsv2rgb(vec3 c) {
  vec4 K = vec4(3. / 3., 2. / 3., 1. / 3., 3.);
  vec3 p = abs(fract(c.xxx + K.xyz) * 6. - K.www);
  return c.z * mix(K.xxx, clamp(p - K.xxx, 0.0, 1.0), c.y);
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

void main(void)
{
    float barsize = 4.0;
    float wav = sin(time * 3.14);
    float factor = wav * 0.03;
    float radioactivity = sign(mod(gl_FragCoord.y, barsize) - barsize / 2.0) * (factor * rand(vec2(v_vTexcoord.x, time))); 
    
    vec2 pos = vec2(0.6, 0.6);
    float radius = 2.0 * time;
    float dist = (1.0 - distance(pos, v_vTexcoord)) * radius;
    vec4 img = texture2D(gm_BaseTexture, vec2(v_vTexcoord.x + radioactivity, v_vTexcoord.y));
    vec3 col = rgb2hsv(img.rgb);
    col = hsv2rgb(vec3(mod(col.r - dist * 0.2, 1.0), col.g + dist, col.b + dist * 0.1));
    
    gl_FragColor = vec4(mix(img.rgb, col, wav), img.a);
}