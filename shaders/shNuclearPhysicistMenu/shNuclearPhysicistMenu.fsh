//
// Simple passthrough fragment shader
//

varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float time;
uniform float seed;

vec3 hsv2rgb(vec3 c) {
  vec4 K = vec4(3. / 3., 2. / 3., 1. / 3., 3.);
  vec3 p = abs(fract(c.xxx + K.xyz) * 6. - K.www);
  return c.z * mix(K.xxx, clamp(p - K.xxx, 0.0, 1.0), c.y);
}

vec3 hsv2rgb2(vec3 c, float k) {
    return smoothstep(0. + k, 1. - k,
                      .5 + .5 * cos((vec3(c.x) + vec3(3., 2., 1.) / 3.) * radians(360.)));
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

float rand(vec2 co){
    return fract(sin(dot(co, vec2(12.9898, 78.233))) * 43758.5453);
}

void main(void)
{
    vec2 uv = v_vTexcoord;
    
    float wdistortion_factor = (0.007 * time / 60.0);
    float wdistortion = sin(uv.x * 64.0 + uv.y * 64.0 + time) * wdistortion_factor; 
    
    float distortion_factor = (0.01 * time / 60.0);
    float distortion = (rand(uv + time) - 0.5) * distortion_factor;
    
    float it = floor(time);
    float ft = fract(time);
    float srand1 = rand(vec2(seed, seed + it + 50.0));
    float srand2 = rand(vec2(seed + it));
    float srand3 = rand(vec2(seed + it + 34.0, seed + 12.0 + it));
    float srand4 = srand1 + srand2 - srand3;
    float displacement_chance =  0.01 + time / 60.0 / 60.0;
    vec2 displacement = vec2(
        step(0.4 + srand1 * 0.3, uv.y) * step(srand2, displacement_chance) * (0.3 + 0.4 * srand3),
        step(0.4 + srand1 * 0.3, uv.x) * step(srand4, displacement_chance) * (0.3 + 0.4 * srand3)
        );
    
    vec2 spos = uv + distortion + wdistortion;
    spos += displacement;
    
    vec4 img = texture2D(gm_BaseTexture, spos);
    
    vec3 hsv = rgb2hsv(img.rgb);
    
    vec3 col = hsv2rgb(vec3(mod(hsv.r + time / 60.0 + displacement.x + displacement.y, 1.0), hsv.g + time / 30.0, hsv.b));
    
    gl_FragColor = vec4(col, img.a) * v_vColour;
}