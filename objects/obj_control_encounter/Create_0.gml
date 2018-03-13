/// @description 

obj_control_music.next_bgm = snd_bgm_battle;

ds_map_set(GAMEDATA, "previous_room", room);
ds_map_set(GAMEDATA, "current_room", rm_battle);
with(obj_warper) {
	fade_color = c_white;
	event_user(0);
}
