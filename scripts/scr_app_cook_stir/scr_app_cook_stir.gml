var item_idx = argument0

var item = ds_list_find_value(obj_control_room_inventory.inventory, item_idx)

var stir_level = ds_map_find_value(item, "stir")
if(is_undefined(stir_level)) {
	stir_level = 0;
	ds_map_add(item, "stir", 0);
}

stir_level = clamp(stir_level-10, 0, 100);
ds_map_set(item, "stir", stir_level);