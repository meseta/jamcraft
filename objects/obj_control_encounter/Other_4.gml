/// @description 

if(room == rm_battle) { // at the start of battle, deactivate player
	instance_deactivate_object(obj_player)
	
	// show player stats
	player_stat_inst = instance_create_depth(x-300, y-300, depth, obj_icon_playerstats);
	player_inst = instance_create_layer(8, 100, "Instances", obj_backsprite);
	
	// enemy
	enemy_inst = instance_create_layer(90, 90, "Instances", obj_enemy);
	enemy_stat_inst = instance_create_depth(x-300, y-300, depth, obj_icon_enemystats);
	
	
}
else {
	// on return to start room, reset previous room to current room
	ds_map_replace(GAMEDATA, "previous_room", room);
	obj_control_music.next_bgm = snd_bgm_overworld;
	instance_destroy();
}