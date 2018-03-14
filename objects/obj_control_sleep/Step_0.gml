/// @description 

if(room == rm_sleep) {
	countdown -= 1
	if(countdown <= 0) {
		var return_room = ds_map_find_value(GAMEDATA, "previous_room");
		ds_map_set(GAMEDATA, "current_room", return_room);
		
		with(obj_warper) {
			fade_color = c_yellow;
			event_user(0);
		}
	}
}