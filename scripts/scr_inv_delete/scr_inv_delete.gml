// take item out of inventory and add to room inventory

var take_item_idx = argument0;
scr_debug("Delete item ", take_item_idx);

// get item from room inventory
var room_inventory = obj_control_room_inventory.inventory;
var room_item = ds_list_find_value(room_inventory, take_item_idx);
ds_map_destroy(room_item);
ds_list_delete(room_inventory, take_item_idx)

// remove from player
with(obj_player) {
	holding = undefined
}

scr_menu_clear();