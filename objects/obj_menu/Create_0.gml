enum MenuPage {
	MAIN,
	VIDEO_SETTINGS,
	AUDIO_SETTINGS,
	GAMEPLAY_SETTINGS,
}
enum MenuAction {
	CHANGE_PAGE,
	RUN_SCRIPT,
	SLIDER,
	SHIFT,
	TOGGLE,
	INPUT,
}
	
main_page = create_menu(
	[
		["PLAY",		MenuAction.RUN_SCRIPT,		start_game				],
		["SETTINGS",	MenuAction.CHANGE_PAGE,		MenuPage.VIDEO_SETTINGS	],
		["EXIT",		MenuAction.RUN_SCRIPT,		close_game				],
	]
)
video_settings_page = create_menu(
	[
		["<- BACK",	MenuAction.CHANGE_PAGE,	MenuPage.MAIN],
	]
)
audio_settings_page = create_menu(
	[
		["<- BACK",	MenuAction.CHANGE_PAGE, MenuPage.MAIN],
	]
)
gameplay_settings_page = create_menu(
	[
		["<- BACK",	MenuAction.CHANGE_PAGE,	MenuPage.MAIN],
	]
)