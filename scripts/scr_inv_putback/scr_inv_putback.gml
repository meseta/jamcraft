// take item out of inventory and add to room inventory

var take_item_idx = argument0;
scr_debug("Put item ", take_item_idx);

// get item from room inventory
var room_inventory = obj_control_room_inventory.inventory;
var room_item = ds_list_find_value(room_inventory, take_item_idx);

// scan for existing item in inventory
var inventory = ds_map_find_value(GAMEDATA, "inventory")
var item = undefined;

for(var i=0; i<ds_list_size(inventory); i++) {
	var test_item = ds_list_find_value(inventory, i);
	if(test_item[? "type"] != room_item[? "type"]) continue;
	if(test_item[? "subtype"] != room_item[? "subtype"]) continue;
	if(test_item[? "quality"] != room_item[? "quality"]) continue;
	if(test_item[? "condition"] != room_item[? "condition"]) continue;
	item = test_item;
	break;
}

if(is_undefined(item)) { // new item, create new
	item = ds_map_create();
	ds_map_copy(item, room_item);
	ds_list_add(inventory, item);
	ds_list_mark_as_map(inventory, ds_list_size(inventory)-1);
}
else { // existing item, increment quantity
	var qty = ds_map_find_value(item, "quantity");
	ds_map_set(item, "quantity", qty+1);
}

// remove from player
with(obj_player) {
	holding = undefined
}

// remove from inventory
ds_map_destroy(room_item);
ds_list_delete(room_inventory, take_item_idx)

scr_menu_clear();