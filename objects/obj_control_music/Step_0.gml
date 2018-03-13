/// @description 

if(next_bgm != noone and next_bgm != current_bgm) { // switch track
	audio_stop_sound(current_bgm);
	
	audio_sound_gain(next_bgm, 0, 0);
	audio_sound_gain(next_bgm, next_bgm_volume, next_bgm_fade);
	
	audio_play_sound(next_bgm, 10, true);
	
	current_bgm = next_bgm;
	current_bgm_volume = next_bgm_volume;
	next_bgm = noone;
}