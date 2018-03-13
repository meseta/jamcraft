/// @description 

if(fade) {	
	if(room != ds_map_find_value(GAMEDATA, "current_room")) { // in previous room
		fade_amount += 0.05;
	
		if(fade_amount >= 1) {
			fade_amount = 1;
			
			with(obj_player) {
				if(not is_undefined(holding)) {
					scr_app_putback(holding)	
				}
			}
			scr_debug("Warp from ", room_get_name(room));
			room_goto(ds_map_find_value(GAMEDATA, "current_room"));
			
			with(obj_control_music) {
				audio_sound_gain(current_bgm, current_bgm_volume, 300);	
			}
		}
	}
	else {
		fade_amount -= 0.05;
		if(fade_amount <= 0) {
			fade_amount = 0;
			fade = false;
			
			with(obj_player) {
				pause = false;
				move_dir = MOVEDIR.undef; // reset movement again
			}
		}
	}
}
