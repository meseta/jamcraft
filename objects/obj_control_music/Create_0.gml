/// @description 
current_bgm = snd_bgm_overworld;
current_bgm_volume = 0.3

audio_sound_gain(current_bgm, current_bgm_volume, 0);
audio_play_sound(current_bgm, 10, true);