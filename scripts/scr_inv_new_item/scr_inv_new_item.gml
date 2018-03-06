/// @function scr_inv_new_item(type, subtype, quantity,quality, condition)
/// @description Create a new item ds_map
/// @param type
/// @param subtype
/// @param quantity
/// @param quality
/// @param condition

var item = ds_map_create();
ds_map_add(item, "type", argument0)
ds_map_add(item, "subtype", argument1)
ds_map_add(item, "quantity", argument2)
ds_map_add(item, "quality", argument3)
ds_map_add(item, "condition", argument4)

return item