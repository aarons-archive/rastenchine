enum DisplayMode {
	fullscreen,
	windowed,
}

global.display_mode = DisplayMode.windowed

function change_display_mode(display_mode) {
	switch (display_mode) {
		case "FULLSCREEN":
			global.display_mode = DisplayMode.fullscreen
			break
		case "WINDOWED":
			global.display_mode = DisplayMode.windowed
			break
	}
}