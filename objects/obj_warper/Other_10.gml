/// @description start warp
fade = true;

with(obj_player) {
	pause = true;
}

if(ds_map_find_value(GAMEDATA, "current_room") != rm_battle) {
	with(obj_control_music) {
		audio_sound_gain(current_bgm, 0, 300);	
	}
}