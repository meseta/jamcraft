var item_type = argument0;

var color = undefined;
var item_type = ds_map_find_value(item_type, "type");	
var library = ds_map_find_value(global.item_library, item_type)
if(not is_undefined(library)) {
	color = ds_map_find_value(library, "color"); // undefined is allowed
}
	
return color;