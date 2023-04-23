global.time = ((global.time + ((0.4 * TIME_SPEED_MULTIPLIER) / FPS)) + 240) % 240

if (global.time > 120) {
	global.ambientShadowIntensity = ((global.time / 120) + 1) % 1
}
else {
	global.ambientShadowIntensity = 1 - ((global.time / 120) + 1) % 1
}
