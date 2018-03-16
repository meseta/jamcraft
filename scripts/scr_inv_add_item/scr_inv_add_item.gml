/// @function scr_inv_add_item(item)
/// @description Add item to inventory
/// @param item

var inventory = ds_map_find_value(GAMEDATA, "inventory");
ds_list_add(inventory, argument0);
ds_list_mark_as_map(inventory, ds_list_size(inventory)-1);
return ds_list_size(inventory)-1;