enum resolution {
	_1920x1080,
	_1280x720,
}

global.resolution = resolution._1280x720

function change_resolution(_resolution) {
	switch (_resolution) {
		case "1920x1080":
			global.resolution = resolution._1920x1080
			break
		case "1280x720":
			global.resolution = resolution._1280x720
			break
	}
}