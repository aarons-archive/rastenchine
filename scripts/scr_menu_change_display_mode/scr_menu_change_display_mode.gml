enum display_mode {
	fullscreen,
	windowed,
}

global.display_mode = display_mode.windowed

function change_display_mode(_display_mode) {
	switch (_display_mode) {
		case "FULLSCREEN":
			global.display_mode = display_mode.fullscreen
			break
		case "WINDOWED":
			global.display_mode = display_mode.windowed
			break
	}
}