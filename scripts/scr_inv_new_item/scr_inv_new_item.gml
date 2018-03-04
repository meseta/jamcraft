/// @function scr_inv_new_item(type, subtype, quantity,quality, condition, jarred)
/// @description Create a new item ds_map
/// @param type
/// @param subtype
/// @param quantity
/// @param quality
/// @param condition
/// @param jarred

var item = ds_map_create();
ds_map_add(item, "type", argument0)
ds_map_add(item, "subtype", argument1)
ds_map_add(item, "quantity", argument2)
ds_map_add(item, "quality", argument3)
ds_map_add(item, "condition", argument4)
ds_map_add(item, "jarred", argument5)

return item