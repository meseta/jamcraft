/// @description 

if(room == rm_battle) {
	if(keyboard_check_released(vk_escape)) {
		scr_debug("escape")
		var return_room = ds_map_find_value(GAMEDATA, "previous_room");
		ds_map_set(GAMEDATA, "current_room", return_room);
		
		instance_activate_object(obj_player)
		with(obj_warper) {
			fade_color = c_black;
			event_user(0);
		}
	}

	if(not instance_exists(select_inst)) {
		select_inst = scr_menu_create(obj_select);
		select_inst.x_offset = 2 * UNIT;
		select_inst.y_offset = 7 * UNIT+2;
		select_inst.width = 6 * UNIT;
		
		scr_menu_add(select_inst.menu_items, 0, "Run", noone, noone)
		scr_menu_add(select_inst.menu_items, 0, "Use", noone, noone)
		scr_menu_add(select_inst.menu_items, 0, "Throw", noone, noone)
		scr_menu_add(select_inst.menu_items, 0, "Attack", noone, noone)
	}
}