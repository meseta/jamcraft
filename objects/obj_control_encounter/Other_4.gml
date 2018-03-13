/// @description 

if(room == rm_battle) { // at the start of battle, deactivate player
	scr_debug("deactivate");
	instance_deactivate_object(obj_player)
}
else {
	// on return to start room, reset previous room to current room
	ds_map_set(GAMEDATA, "previous_room", room);
	obj_control_music.next_bgm = snd_bgm_overworld;
	instance_destroy();
}