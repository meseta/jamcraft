/// @description start warp
fade = true;

with(obj_player) {
	pause = true;
}

if(ds_map_find_value(GAMEDATA, "current_room") != rm_battle) {
	var fade_ms = 1000/(room_speed * fade_rate * fade_rate_multiplier);
	with(obj_control_music) {
		audio_sound_gain(current_bgm, current_bgm_volume/3, fade_ms);	
	}
}

scr_debug("Prev: ", room_get_name(ds_map_find_value(GAMEDATA, "previous_room")))
scr_debug("Next: ", room_get_name(ds_map_find_value(GAMEDATA, "current_room")))