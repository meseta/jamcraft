// take item out of inventory and add to room inventory

var take_item_idx = argument0;
scr_debug("Take item ", take_item_idx);

// get item from inventory
var inventory = ds_map_find_value(GAMEDATA, "inventory")
var item = ds_list_find_value(inventory, take_item_idx);
var qty = ds_map_find_value(item, "quantity");

// add to room inventory
var room_inventory = obj_control_room_inventory.inventory;
if(qty > 1) {
	var room_item = ds_map_create();
	ds_map_copy(room_item, item);

	// subtract 1 from inventory
	ds_map_replace(item, "quantity", qty-1);
}
else {
	var room_item = item
	
	// remove from inventory
	ds_list_delete(inventory, take_item_idx)
}


ds_map_replace(room_item, "quantity", 1);
ds_list_add(room_inventory, room_item);
var room_item_idx = ds_list_size(room_inventory)-1;
ds_list_mark_as_map(room_inventory, room_item_idx);

// add to player
with(obj_player) {
	holding = room_item_idx;
}

scr_menu_clear();
