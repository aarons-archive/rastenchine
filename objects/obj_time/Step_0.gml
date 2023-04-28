global.time = wrap((global.time + ((0.4 * global.time_speed_multiplier) / FPS)), 240)

var shadow_intensity = wrap((global.time / 120), 1)
global.ambientShadowIntensity = (global.time > 120) ? (shadow_intensity) : (1 - shadow_intensity) 
