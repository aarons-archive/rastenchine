global.time = ((global.time + (2.4 / FPS)) + 240) % 240

if (global.time > 120) {
	global.ambientShadowIntensity = ((global.time / 120) + 1) % 1
}
else {
	global.ambientShadowIntensity = 1 - ((global.time / 120) + 1) % 1
}
