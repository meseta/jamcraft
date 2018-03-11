/// @description Insert description here
// You can write your code in this editor

var rm_inv = ds_map_find_value(GAMEDATA, "room_inventory");
inventory = ds_map_find_value(rm_inv, room);

if(is_undefined(inventory)) {
	inventory = ds_map_create();
	ds_map_add_map(rm_inv, room, inventory);
}