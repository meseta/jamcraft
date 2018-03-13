/// @description 

if(is_undefined(link_room)) { // when undefined, send back to previous room
	link_room = ds_map_find_value(GAMEDATA, "previous_room");
}

if(link_room != noone) {
	if(obj_warper.fade == false) {
		ds_map_set(GAMEDATA, "previous_room", room);
		ds_map_set(GAMEDATA, "current_room", link_room);
		with(obj_warper) {
			fade_color = c_black;
			fade_rate_multiplier = 1;
			event_user(0);		
		}
	}
}
