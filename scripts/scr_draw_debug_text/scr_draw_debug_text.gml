function draw_debug_text() {
	draw_set_font(fnt_game)

	#region Bottom Left text
	draw_set_halign(fa_left)
	draw_set_valign(fa_bottom)

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

	draw_text_color( 
		UI_X1 + UI_MARGIN, 
		UI_Y2 - UI_MARGIN, 
		names, 
		c_white, c_white, c_white, c_white,
		1
	)
	draw_text_color(
		UI_X1 + UI_MARGIN + string_width(names), 
		UI_Y2 - UI_MARGIN,
		values,
		c_white, c_white, c_white, c_white,
		1
	)
	#endregion
	
	#region Bottom Right text
	draw_set_halign(fa_right)
	draw_set_valign(fa_bottom)

	names = "Debug Text: \nDebug Enemies: \nDebug Lights: \nDebug Alignment: \nDebug Camera: \nCamera Zooming: "
	values = string(global.debug_text) + "\n" + 
			 string(global.debug_enemies) + "\n" + 
			 string(global.debug_lights) + "\n" + 
			 string(global.debug_alignment) + "\n" + 
			 string(global.debug_camera) + "\n" +
			 string(global.camera_zooming)
	
	draw_text_color(
		UI_X2 - UI_MARGIN, 
		UI_Y2 - UI_MARGIN,
		values,
		c_white, c_white, c_white, c_white,
		1
	)
	draw_text_color( 
		UI_X2 - UI_MARGIN - string_width(values), 
		UI_Y2 - UI_MARGIN, 
		names,
		c_white, c_white, c_white, c_white,
		1
	)
	#endregion
}
