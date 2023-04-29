global.ambientShadowIntensity = 0.5

light = light_create_point(mouse_x, mouse_y, 64000, $ffffffff, 256, 2)
light_add_to_world(light)

enum MenuPage {
	home,
	settings,
}
enum MenuSettingsSubPage {
	video,
	audio,
	gameplay,
}
enum MenuElementAction {
	run_script,
	slide_value,
	shift_value,
	toggle_value,
	input_value,
}

home = [
	["PLAY",          MenuElementAction.run_script,  play_game,                   undefined,                   undefined                   ],
	["SETTINGS",      MenuElementAction.run_script,  menu_change_page,            MenuPage.settings,           MenuSettingsSubPage.video   ],
	["EXIT",          MenuElementAction.run_script,  exit_game,                   undefined,                   undefined                   ],
]
settings = [
	["<- BACK",       MenuElementAction.run_script,  menu_change_page,            MenuPage.home,               undefined                   ],
	["VIDEO",         MenuElementAction.run_script,  menu_change_page,            MenuPage.settings,           MenuSettingsSubPage.video   ],
	["AUDIO",         MenuElementAction.run_script,  menu_change_page,            MenuPage.settings,           MenuSettingsSubPage.audio   ],
	["GAMEPLAY",      MenuElementAction.run_script,  menu_change_page,            MenuPage.settings,           MenuSettingsSubPage.gameplay],
]
video_settings = [
	["RESOLUTION",    MenuElementAction.shift_value, change_resolution,           global.resolution,           ["1920x1080", "1280x720"]   ],
	["DISPLAY MODE",  MenuElementAction.shift_value, change_display_mode,         global.display_mode,         ["FULLSCREEN", "WINDOWED"]  ],
]
audio_settings = [
	["MASTER",        MenuElementAction.slide_value, change_main_volume,          global.main_volume,          undefined                   ],
	["SOUND EFFECTS", MenuElementAction.slide_value, change_sound_effects_volume, global.sound_effects_volume, undefined                   ],
	["MUSIC",         MenuElementAction.slide_value, change_music_volume,         global.music_volume,         undefined                   ],
]
gameplay_settings = [
	["DIFFICULTY",    MenuElementAction.shift_value, change_difficulty,           global.difficulty,           ["EASY", "MEDIUM", "HARD"]  ],
]

pages = [home, settings]
selected_page = MenuPage.home

sub_pages = [video_settings, audio_settings, gameplay_settings]
selected_sub_page = undefined

instances = []
menu_render_page()