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
	var overlay_sprite = undefined;
	var overlay_sprite_subimage = 0;
	var overlay_sprite_color = c_white;
	
	if(not is_undefined(library)) {
		var library_name = ds_map_find_value(library, "name");
		
		var library_subtypes = ds_map_find_value(library, "subtypes")
		if(not is_undefined(library_subtypes)) {
			var subtype = ds_map_find_value(library_subtypes, item_subtype);
			sprite = ds_map_find_value(subtype, "sprite");
			sprite_subimage = ds_map_find_value(subtype, "subimage");
			
			// draw overlay colors
	
			var content_color = ds_map_find_value(item, "content_color")
			if(not is_undefined(content_color) and item_subtype == SUBTYPE.equipment) {
				var overlay = ds_map_find_value(library_subtypes, SUBTYPE.equipment_overlay);
				if(not is_undefined(overlay)) {
					overlay_sprite = ds_map_find_value(overlay, "sprite");
					overlay_sprite_subimage = ds_map_find_value(overlay, "subimage");
					overlay_sprite_color = content_color;
				}
			}
		}
	}

	draw_sprite(sprite, sprite_subimage, xx, yy);
	if(not is_undefined(overlay_sprite)) {
		draw_sprite_ext(overlay_sprite, overlay_sprite_subimage, xx, yy, 1, 1, 0, overlay_sprite_color, 1);
	}
	

	return library_name
}
