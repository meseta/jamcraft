/// @description 

var previous_room = ds_map_find_value(GAMEDATA, "previous_room");
if(is_undefined(previous_room)) { // no previous room set, drop at droppoint
	previous_room = noone;
}

// find a warp instance with matching linkroom, this is the drop-point
var warp_inst = noone;
with(obj_warp) {
	if(link_room == noone) {
		warp_inst = id;
		break;
	}
}

// move player to it
if(warp_inst != noone) {
	obj_player.x = warp_inst.x;
	obj_player.y = warp_inst.y;
}