//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform vec2 area_position;
uniform vec2 area_size;
uniform vec2 resolution;
uniform vec2 uv_top;
uniform vec2 uv_bottom;
uniform float time;
uniform vec2 pixel;

float random (vec2 st) {
    return fract(sin(dot(st.xy, vec2(12.9898,78.233))) * 43758.5453123);
}

vec2 texclamp(vec2 st) {
	return clamp(st, uv_top + pixel, uv_bottom - pixel);
}

void main(void)
{
	vec2 uv = v_vTexcoord;
	
	vec2 texsize = uv_bottom - uv_top;
	vec2 top = area_position * texsize + uv_top;
	vec2 bottom = (area_position + area_size) * texsize + uv_top;
	
	float itime = floor(time);
    float n1 = random(vec2(uv.x + itime));
    float n2 = random(vec2(uv.x + itime + 1.0));
	
	float distortion = sin(uv.x * 70.6 + uv.y * 50.0 + time) * 0.01;
	uv.x += vec2(distortion, distortion * 0.1);
	
	float clamping = mix(n1, n2, fract(time)) * clamp(1.5 - time, 0.1, 1.0) * (bottom.y - top.y);
	uv.y = clamp(uv.y, top.y + clamping, bottom.y - clamping);
	
	float alpha = floor(random(vec2(uv.x, 100.0)) + min(time, 1.0));
	
	gl_FragColor = texture2D(gm_BaseTexture, texclamp(uv)) * v_vColour * alpha;
}