enum DisplayMode {
	FULLSCREEN,
	WINDOWED,
}

function change_display_mode(display_mode) {
	switch (display_mode) {
		case "FULLSCREEN":
			global.display_mode = DisplayMode.FULLSCREEN
			break
		case "WINDOWED":
			global.display_mode = DisplayMode.WINDOWED
			break
	}
}

global.display_mode = DisplayMode.WINDOWED