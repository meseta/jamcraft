/// @description 

if(room == rm_battle) { // at the start of battle, deactivate player
	instance_deactivate_object(obj_player)
	player_stat_inst = instance_create_depth(x-300, y-300, depth, obj_icon_playerstats);
}
else {
	// on return to start room, reset previous room to current room
	ds_map_set(GAMEDATA, "previous_room", room);
	obj_control_music.next_bgm = snd_bgm_overworld;
	instance_destroy();
}