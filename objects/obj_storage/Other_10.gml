/// @description Insert description here
// You can write your code in this editor

if(is_decorative) exit;

// create inventory instance (create it offscreen)
menu_inst = scr_menu_create(obj_inventory);
menu_inst.can_take = true;

scr_debug("Open inventory inst ", menu_inst)

// create filtered inventory
var filtered_inventory = ds_list_create();
var inventory = ds_map_find_value(GAMEDATA, "inventory");
for(var i=0; i<ds_list_size(inventory); i++) {
	var item = ds_list_find_value(inventory, i);
	var subtype = ds_map_find_value(item, "subtype")
	
	// check if subtype is in filter list
	if(scr_inv_in_filter(subtype, filter_list)) {
		ds_list_add(filtered_inventory, i);
	}
}

menu_inst.inventory_map = filtered_inventory
