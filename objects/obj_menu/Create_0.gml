enum menu_page {
	home,
	settings,
}
enum menu_settings_sub_page {
	video,
	audio,
	gameplay,
}
enum menu_element_action {
	run_script,
	slide_value,
	shift_value,
	toggle_value,
	input_value,
}

home = [
	["PLAY",          menu_element_action.run_script,  play_game,                   undefined,                   undefined                      ],
	["SETTINGS",      menu_element_action.run_script,  change_page,                 menu_page.settings,          menu_settings_sub_page.video   ],
	["EXIT",          menu_element_action.run_script,  exit_game,                   undefined,                   undefined                      ],
]
settings = [
	["<- BACK",       menu_element_action.run_script,  change_page,                 menu_page.home,              undefined                      ],
	["VIDEO",         menu_element_action.run_script,  change_page,                 menu_page.settings,          menu_settings_sub_page.video   ],
	["AUDIO",         menu_element_action.run_script,  change_page,                 menu_page.settings,          menu_settings_sub_page.audio   ],
	["GAMEPLAY",      menu_element_action.run_script,  change_page,                 menu_page.settings,          menu_settings_sub_page.gameplay],
]
video_settings = [
	["RESOLUTION",    menu_element_action.shift_value, change_resolution,           global.resolution,           ["1920x1080", "1280x720"]      ],
	["DISPLAY MODE",  menu_element_action.shift_value, change_display_mode,         global.display_mode,         ["FULLSCREEN", "WINDOWED"]     ],
]
audio_settings = [
	["MASTER",        menu_element_action.slide_value, change_main_volume,          global.main_volume,          undefined                      ],
	["SOUND EFFECTS", menu_element_action.slide_value, change_sound_effects_volume, global.sound_effects_volume, undefined                      ],
	["MUSIC",         menu_element_action.slide_value, change_music_volume,         global.music_volume,         undefined                      ],
]
gameplay_settings = [
	["DIFFICULTY",    menu_element_action.shift_value, change_difficulty,           global.difficulty,           ["EASY", "MEDIUM", "HARD"]     ],
]

pages = [home, settings]
selected_page = menu_page.home

sub_pages = [video_settings, audio_settings, gameplay_settings]
selected_sub_page = undefined

instances = []
draw_page()