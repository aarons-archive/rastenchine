function change_page(page, sub_page) {
	with (obj_menu) {
		selected_page = page
		selected_sub_page = sub_page
		array_map_ext(instances, function(element) {instance_destroy(element)})
		array_resize(instances, 0)
		draw_page()
	}
}
