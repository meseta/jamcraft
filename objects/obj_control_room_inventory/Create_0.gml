/// @description Insert description here
// You can write your code in this editor

var rm_inv = ds_map_find_value(GAMEDATA, "room_inventory");
inventory = ds_map_find_value(rm_inv, string(room));

if(is_undefined(inventory)) {
	inventory = ds_list_create();
	ds_map_add_list(rm_inv, room, inventory);
}

// restore objects
for(var i=0; i<ds_list_size(inventory); i++) {
	var item = ds_list_find_value(inventory, i);
	var room_object = ds_map_find_value(item, "workstation_holding");
	if(not is_undefined(room_object)) {
		room_object.holding = i;
	}
}