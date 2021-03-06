	// empty pot

var take_item_idx = argument0;
scr_debug("Empty ", take_item_idx);

// get item from room inventory
var room_inventory = obj_control_room_inventory.inventory;
var room_item = ds_list_find_value(room_inventory, take_item_idx);
var item_name = scr_lib_lookup(room_item, "name");

// empty contents
var contents = ds_map_find_value(room_item, "contents");
if(not is_undefined(contents)) {
	ds_list_destroy(contents);
	ds_map_delete(room_item, "contents");
}

var stir = ds_map_find_value(room_item, "stir");
if(not is_undefined(stir)) {
	ds_map_replace(room_item, "stir", 0);
}

var disp_inst = instance_create_depth(x-200, y-200, depth-1, obj_icon_trash);
disp_inst.item_idx = take_item_idx;
disp_inst.delete_animate = true;

ds_map_replace(room_item, "content_color", undefined);

scr_menu_clear();

if(is_undefined(item_name)) item_name = "Container"
scr_alert(item_name + " was emptied!");