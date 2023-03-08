enum Resolution {
	_1920x1080,
	_1280x720,
}

function change_resolution(resolution) {
	switch (resolution) {
		case "1920x1080":
			global.resolution = Resolution._1920x1080
			break
		case "1280x720":
			global.resolution = Resolution._1280x720
			break
	}
}

global.resolution = Resolution._1280x720