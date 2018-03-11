/// @description 

if(link_room != noone) {
	ds_map_set(GAMEDATA, "previous_room", room);
	ds_map_set(GAMEDATA, "current_room", link_room);
	room_goto(link_room);
}
