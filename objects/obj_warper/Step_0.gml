/// @description 

if(fade) {	
	if(room != ds_map_find_value(GAMEDATA, "current_room")) { // in previous room
		fade_amount += 0.05;
	
		if(fade_amount >= 1) {
			fade_amount = 1;
			room_goto(ds_map_find_value(GAMEDATA, "current_room"));
		}
	}
	else {
		fade_amount -= 0.05;
		if(fade_amount <= 0) {
			fade_amount = 0;
			fade = false;
			obj_player.pause = false;
			obj_player.move_dir = MOVEDIR.undef; // reset movement again
		}
	}
}
