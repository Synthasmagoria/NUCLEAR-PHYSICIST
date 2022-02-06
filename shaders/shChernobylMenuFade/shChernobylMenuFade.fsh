varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main() {
	vec4 img = texture2D(gm_BaseTexture, v_vTexcoord);
	gl_FragColor = v_vColour * vec4(img.rgb - 0.03, img.a);
}