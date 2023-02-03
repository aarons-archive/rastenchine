var exists

if (dirty || tick >= global.lightUpdateFrameDelay || global.worldShadowMap == undefined || !surface_exists(global.worldShadowMap)) {
	exists = composite_shadow_map(global.worldLights)
	dirty = false
	tick = 0
}
else {
	exists = surface_exists(global.worldShadowMap)
}

if (exists) {
	var camera = lighting_get_active_camera()
	draw_shadow_map(camera[eLightingCamera.X], camera[eLightingCamera.Y])
}