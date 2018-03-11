var item_name = argument0
var item_type = argument1
var part_color = argument2

var item = ds_map_create();
ds_map_add(item, "name", item_name);
ds_map_add_map(item, "subtypes", ds_map_create());
ds_map_add(item, "color", part_color);

ds_map_add_map(global.item_library, item_type, item);
return item;
	