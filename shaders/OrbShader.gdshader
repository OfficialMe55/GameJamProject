shader_type spatial;
render_mode unshaded;
uniform vec3 outline_color : source_color = vec3(0.2, 0.8, 1.0);
uniform float outline_strength : hint_range(0.0, 5.0) = 2.0;
uniform float outline_power : hint_range(0.1, 8.0) = 3.0;
void fragment() {
	float fresnel = pow(1.0 - dot(NORMAL, VIEW), outline_power);
	ALBEDO = outline_color * fresnel * outline_strength; ALPHA = fresnel;
	}