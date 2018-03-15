/// @description 

if(room == rm_battle) {
	if(keyboard_check_released(vk_escape)) {
		var return_room = ds_map_find_value(GAMEDATA, "previous_room");
		ds_map_replace(GAMEDATA, "current_room", return_room);
		
		with(obj_warper) {
			fade_color = c_black;
			event_user(0);
		}
	}

	if(not instance_exists(select_inst)) {
		select_inst = scr_menu_create(obj_select);
		select_inst.x_offset = 0.5 * UNIT - 2;
		select_inst.y_offset = 7 * UNIT;
		select_inst.width = 4 * UNIT;
		
		scr_menu_add(select_inst.menu_items, 0, "Run", noone, noone)
		scr_menu_add(select_inst.menu_items, 0, "Use", scr_inventory_use, noone)
		scr_menu_add(select_inst.menu_items, 0, "Throw", scr_inventory_throw, noone)
		scr_menu_add(select_inst.menu_items, 0, "Attack", noone, noone)
	}
}