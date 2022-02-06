//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;
varying vec2 v_vPosition;

uniform float time;
uniform float wobble;
	
void main()
{
	vec2 uv = v_vTexcoord;
	vec2 pos = uv * 2.0 - 1.0;
    gl_FragColor = v_vColour * texture2D( gm_BaseTexture, mod(uv + sin((pos.x * 200.0 + pos.y * 20.0) + time) * wobble, 1.0) );
}
