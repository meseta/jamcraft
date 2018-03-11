var item = argument0;
var lookup = argument1;

var retval = undefined;
var item_type = ds_map_find_value(item, "type");	
var library = ds_map_find_value(global.item_library, item_type)
if(not is_undefined(library)) {
	var item_subtype = ds_map_find_value(item, "subtype");
	var library_subtypes = ds_map_find_value(library, "subtypes")
	if(not is_undefined(library_subtypes)) {
		var subtype = ds_map_find_value(library_subtypes, item_subtype);
		if(not is_undefined(subtype)) {
			retval = ds_map_find_value(subtype, lookup); // undefined is allowed
		}
	}
}
	
return retval;