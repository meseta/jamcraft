/// @description 

if(fade) {
	if(room != ds_map_find_value(GAMEDATA, "current_room")) { // in previous room
		fade_amount += fade_rate * fade_rate_multiplier;
	
		if(fade_amount >= 1) {
			fade_amount = 1;
			
			instance_activate_object(obj_player)
			with(obj_player) {
				if(not is_undefined(holding)) {
					scr_app_putback(holding)	
				}
			}
			scr_debug("Warp from ", room_get_name(room));
			room_goto(ds_map_find_value(GAMEDATA, "current_room"));
			
			var fade_ms = 1000/(room_speed * fade_rate * fade_rate_multiplier);
			with(obj_control_music) {
				audio_sound_gain(current_bgm, current_bgm_volume, fade_ms);	
			}
		}
	}
	else {
		fade_amount -= fade_rate * fade_rate_multiplier;
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
