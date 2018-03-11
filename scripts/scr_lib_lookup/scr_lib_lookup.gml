var item = argument0;
var lookup = argument1;

var retval = undefined;
var item_type = ds_map_find_value(item, "type");	
var library = ds_map_find_value(global.item_library, item_type)
if(not is_undefined(library)) {
	retval = ds_map_find_value(library, lookup); // undefined is allowed
}
	
return retval;