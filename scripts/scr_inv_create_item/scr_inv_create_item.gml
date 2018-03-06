var item_name = argument0
var item_type = argument1

var item = ds_map_create();
ds_map_add(item, "name", item_name);
ds_map_add(item, "subtypes", ds_map_create());

ds_map_add(global.item_library, item_type, item);
return item;
