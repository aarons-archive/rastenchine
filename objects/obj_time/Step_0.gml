ticks = ((ticks + (0.4 / FPS)) + 240) % 240
if (ticks > 120) {
	global.ambientShadowIntensity = ((ticks / 120) + 1) % 1
}
else {
	global.ambientShadowIntensity = 1 - ((ticks / 120) + 1) % 1
}
