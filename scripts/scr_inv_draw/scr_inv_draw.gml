var item = argument0;
var xx = argument1;
var yy = argument2;

if(not is_undefined(item)) {
	var item_type = ds_map_find_value(item, "type");
	var library = ds_map_find_value(global.item_library, item_type)
	if(not is_undefined(library)) {
		var sprite = ds_map_find_value(library, "sprite");
		var library_name = ds_map_find_value(library, "name");
		var sprite_subimage = ds_map_find_value(library, "subimage");
	}
	else {
		var sprite = spr_item_undef;
		var library_name = "UNDEF#" + string(item_type);
		var sprite_subimage = 0;
	}
	draw_sprite(sprite, sprite_subimage, xx, yy);
}