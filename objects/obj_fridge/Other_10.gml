/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

// create filtered inventory
var filtered_inventory = ds_list_create();
var inventory = ds_map_find_value(GAMEDATA, "inventory");
for(var i=0; i<ds_list_size(inventory); i++) {
	var item = ds_list_find_value(inventory, i);
	
	switch(ds_map_find_value(item, "subtype")) {
		case SUBTYPE.whole:
		case SUBTYPE.peeled:
		case SUBTYPE.peel:
		case SUBTYPE.chopped:
		case SUBTYPE.pulp:
		case SUBTYPE.juice:
			ds_list_add(filtered_inventory, i);
	}
}

menu_inst.inventory_map = filtered_inventory
menu_inst.inventory_size = ds_list_size(filtered_inventory);
