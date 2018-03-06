var item = argument0;
var xx = argument1;
var yy = argument2;

if(not is_undefined(item)) {
	var item_type = ds_map_find_value(item, "type");
	var item_subtype = ds_map_find_value(item, "subtype");
	var library = ds_map_find_value(global.item_library, item_type)
	
	
	var sprite = spr_item_undef;
	var sprite_subimage = 0;
	var library_name = "UNDEF#" + string(item_type);
	
	if(not is_undefined(library)) {
		var library_name = ds_map_find_value(library, "name");
		
		var library_subtypes = ds_map_find_value(library, "subtypes")
		if(not is_undefined(library_subtypes)) {
			var subtype = ds_map_find_value(library_subtypes, item_subtype);
			var sprite = ds_map_find_value(subtype, "sprite");
			var sprite_subimage = ds_map_find_value(subtype, "subimage");
		}
	}

	draw_sprite(sprite, sprite_subimage, xx, yy);
	return library_name
}
