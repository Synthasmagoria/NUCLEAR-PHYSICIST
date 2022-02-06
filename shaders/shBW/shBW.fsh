varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float factor;

void main() {
	vec4 img = texture2D(gm_BaseTexture, v_vTexcoord);
	img.rgb = mix(img.rgb, vec3((img.r + img.g + img.b) / 3.0), factor);
	gl_FragColor = v_vColour * img;
}