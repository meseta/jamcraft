/// @description 

if(keyboard_check_pressed(vk_escape)) {
	var return_room = ds_map_find_value(GAMEDATA, "previous_room");

	ds_map_set(GAMEDATA, "previous_room", room);
	ds_map_set(GAMEDATA, "current_room", return_room);
	with(obj_warper) {
		fade_color = c_black;
		event_user(0);
	}
}