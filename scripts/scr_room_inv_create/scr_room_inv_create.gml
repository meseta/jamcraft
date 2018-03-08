// take item out of inventory and add to room inventory

var room_item = ds_map_create();
ds_map_add(room_item, "type", argument0)
ds_map_add(room_item, "subtype", argument1)
ds_map_add(room_item, "quantity", 1)
ds_map_add(room_item, "quality", argument2)
ds_map_add(room_item, "condition", argument3)

// add to room inventory
var room_inventory = obj_control_room_inventory.inventory;
ds_list_add(room_inventory, room_item);
var room_item_idx = ds_list_size(room_inventory)-1;
ds_list_mark_as_map(room_inventory, room_item_idx);

scr_debug("Create room item ", room_item_idx);
return room_item_idx;
