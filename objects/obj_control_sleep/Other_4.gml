/// @description 

if(room == rm_sleep) { // at the start of battle, deactivate player
	instance_deactivate_object(obj_player)
	scr_player_reset();
	scr_alert("HP and Energy restored!")
}
else {
	// on return to start room, reset previous room to current room
	ds_map_replace(GAMEDATA, "previous_room", room);
	instance_destroy();
}