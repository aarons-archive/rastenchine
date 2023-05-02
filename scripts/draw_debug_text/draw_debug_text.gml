function draw_debug_text() {
	_draw_bottom_left_debug_text()
	_draw_bottom_right_debug_text()
}

function _draw_bottom_left_debug_text() {
	// set font/alignment
	draw_set_font(fnt_game)
	draw_set_halign(fa_left)
	draw_set_valign(fa_bottom)
	// get names + values
	var names = ""
	var values = ""
	if (instance_exists(obj_camera)) {
		names += "\nCamera Zoom: "
		values += "\n" + string(obj_camera.zoom) 
	}
	if (instance_exists(obj_time)) {
		names += "\nTime: \nShadow Intensity: "
		values += "\n" + string(global.time) + "\n" + string(global.ambientShadowIntensity)
	}
	if (instance_exists(obj_player)) {
		names += "\nMovement State: \nSpeed: "
		values += "\n" + string(obj_player.movement_state) + "\n" + string(obj_player._speed)
		var item = obj_player.inventory.item
		if (is_instanceof(item, Weapon)) {
			names += "\nItem State: \nItem Damage: "
			values += "\n" + string(item.state) + "\n" + string(item.damage)
	 	}
		if (is_instanceof(item, Melee)) {
			names += "\nCrowbar Charge: "
			values += "\n" + string(item.charge)
		}
		if (is_instanceof(item, Ranged)) {
			names += "\nGun Ammo: \nGun Clip: "
			values += "\n" + string(item.ammo) + "\n" + string(item.clip)
		}
	}
	// draw names + values
	draw_text_color( 
		GUI_X1, GUI_Y2, 
		names, 
		c_white, c_white, c_white, c_white, 1
	)
	draw_text_color(
		GUI_X1 + string_width(names), GUI_Y2,
		values,
		c_white, c_white, c_white, c_white, 1
	)

}

function _draw_bottom_right_debug_text() {
	// set font/alignment
	draw_set_font(fnt_game)
	draw_set_halign(fa_right)
	draw_set_valign(fa_bottom)
	// get names + values
	var names = "Debug Text: \nDebug Enemies: \nDebug Lights: \nDebug GUI: \nDebug Camera: \nCamera Zooming: "
	var values = string(global.debug_text) + "\n" + 
			     string(global.debug_enemies) + "\n" + 
			     string(global.debug_lights) + "\n" + 
			     string(global.debug_gui) + "\n" + 
			     string(global.debug_camera) + "\n" +
			     string(global.camera_zooming)
	// draw names + values
	draw_text_color(
		GUI_X2, GUI_Y2,
		values,
		c_white, c_white, c_white, c_white,
		1
	)
	draw_text_color( 
		GUI_X2 - string_width(values), GUI_Y2, 
		names,
		c_white, c_white, c_white, c_white,
		1
	)
}
