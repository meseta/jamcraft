var item = argument0;

var item_type = ds_map_find_value(item, "type");
var library = ds_map_find_value(global.item_library, item_type)

if(not is_undefined(library)) {
	var item_subtype = ds_map_find_value(item, "subtype");
	var library_subtypes = ds_map_find_value(library, "subtypes")
	if(not is_undefined(library_subtypes)) {
		var subtype = ds_map_find_value(library_subtypes, item_subtype);
		var cook_rate = ds_map_find_value(subtype, "cook_rate");
		if(not is_undefined(cook_rate)) {
			return cook_rate;
		}
	}
}

return 0;