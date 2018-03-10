// delete item

var take_item_idx = argument0;
scr_debug("Delete item ", take_item_idx);

// get item from room inventory
var room_inventory = obj_control_room_inventory.inventory;
var room_item = ds_list_find_value(room_inventory, take_item_idx);
var item_name = scr_lib_name(room_item);
ds_map_destroy(room_item);

ds_list_set(room_inventory, take_item_idx, undefined);

// remove from player
with(obj_player) {
	holding = undefined
}

var disp_inst = instance_create_depth(x-200, y-200, depth-1, obj_icon_trash);
disp_inst.delete_animate = true;

scr_menu_clear();

if(is_undefined(item_name)) item_name = "Item"
scr_alert(item_name + " was trashed!");