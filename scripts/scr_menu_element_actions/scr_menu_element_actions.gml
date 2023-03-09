#region Control
function play_game() { room_goto(rm_nico_aaron_dev) }
function exit_game() { game_end() }
#endregion

#region Video
enum resolution {
	_1920x1080,
	_1280x720,
}
enum display_mode {
	fullscreen,
	windowed,
}

global.resolution = resolution._1280x720
global.display_mode = display_mode.windowed

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
#endregion

#region Audio
global.main_volume = 100
global.sound_effects_volume = 100
global.music_volume = 100
function change_main_volume(volume) { global.main_volume = volume }
function change_sound_effects_volume(volume) { global.sound_effects_volume = volume }
function change_music_volume(volume) { global.music_volume = volume }
#endregion

#region Gameplay
enum difficulty {
	easy,
	medium,
	hard,
}

global.difficulty = difficulty.easy

function change_difficulty(_difficulty) {
	switch (_difficulty) {
		case "EASY":
			global.difficulty = difficulty.easy
			break
		case "MEDIUM":
			global.difficulty = difficulty.medium
			break
		case "HARD":
			global.difficulty = difficulty.hard
			break
	}
}
#endregion