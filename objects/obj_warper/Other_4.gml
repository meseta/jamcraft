/// @description 

var previous_room = ds_map_find_value(GAMEDATA, "previous_room");
if(is_undefined(previous_room)) { // no previous room set, drop at droppoint
	previous_room = noone;
}

// find a warp instance with matching linkroom, this is the drop-point
var warp_inst = noone;
with(obj_warp) {
	if((previous_room == noone and link_room == noone and object_index == obj_warp) or
		(previous_room != noone and link_room == previous_room)) {
		warp_inst = id;
		break;
	}
}

// move player to it
if(warp_inst != noone) {
	scr_debug("Warp to ", room_get_name(room));
	obj_player.x = warp_inst.x;
	obj_player.y = warp_inst.y;
	obj_player.move_target_x = warp_inst.x;
	obj_player.move_target_y = warp_inst.y;
	obj_player.move_last_dir = warp_inst.exit_dir;
	obj_player.move_dir = MOVEDIR.undef;
	obj_player.move_is_moving = false;
}