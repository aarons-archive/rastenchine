enum MenuPage {
	MAIN,
	SETTINGS,
}
enum MenuSubPage {
	SETTINGS_VIDEO,
	SETTINGS_AUDIO,
	SETTINGS_GAMEPLAY,
}
enum MenuElement {
	CHANGE_PAGE,
	CHANGE_SUBPAGE,
	RUN_SCRIPT,
	SLIDER,
	SHIFT,
	TOGGLE,
	INPUT,
}
	
main = create_menu(
	[
		["PLAY", MenuElement.RUN_SCRIPT, play_game, undefined, undefined],
		["SETTINGS", MenuElement.RUN_SCRIPT, change_page, MenuPage.SETTINGS, MenuSubPage.SETTINGS_VIDEO],
		["EXIT", MenuElement.RUN_SCRIPT, exit_game, undefined, undefined],
	]
)
settings = create_menu(
	[
		["<- BACK", MenuElement.RUN_SCRIPT, change_page, MenuPage.MAIN, undefined],
		["VIDEO", MenuElement.RUN_SCRIPT, change_page, MenuPage.SETTINGS, MenuSubPage.SETTINGS_VIDEO],
		["AUDIO", MenuElement.RUN_SCRIPT, change_page, MenuPage.SETTINGS, MenuSubPage.SETTINGS_AUDIO],
		["GAMEPLAY", MenuElement.RUN_SCRIPT, change_page, MenuPage.SETTINGS, MenuSubPage.SETTINGS_GAMEPLAY],
	]
)
settings_video = create_menu(
	[
		["RESOLUTION", MenuElement.SHIFT, change_resolution, global.resolution, ["1920x1080", "1280x720"]],
		["DISPLAY MODE", MenuElement.SHIFT, change_display_mode, global.display_mode, ["FULLSCREEN", "WINDOWED"]],
	]
)
settings_audio = create_menu(
	[
		["MASTER", MenuElement.SLIDER, change_main_volume, global.main_volume],
		["SOUND EFFECTS", MenuElement.SLIDER, change_sound_effects_volume, global.sound_effects_volume],
		["MUSIC", MenuElement.SLIDER, change_music_volume, global.music_volume],
	]
)
settings_gameplay = create_menu(
	[
		["DIFFICULTY", MenuElement.SHIFT, change_difficulty, global.difficulty, ["EASY", "MEDIUM", "HARD"]],
	]
)

pages = [main, settings]
page = MenuPage.MAIN

subpages = [settings_video, settings_audio, settings_gameplay]
subpage = undefined

buttons = ds_list_create()

draw_menu()