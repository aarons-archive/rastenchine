global.time = wrap_value(
	global.time + ((0.4 * TIME_SPEED_MULTIPLIER) / FPS), 
	240
)

var shadow_intensity = wrap_value(
	global.time / 120, 
	1
)

if (global.time > 120) { 
	global.ambientShadowIntensity = shadow_intensity 
}
else { 
	global.ambientShadowIntensity = 1 - shadow_intensity
}
