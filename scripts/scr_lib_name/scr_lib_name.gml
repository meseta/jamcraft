var item_type = argument0;

var name = undefined;
var item_type = ds_map_find_value(item_type, "type");	
var library = ds_map_find_value(global.item_library, item_type)
if(not is_undefined(library)) {
	name = ds_map_find_value(library, "name"); // undefined is allowed
}
	
return name;