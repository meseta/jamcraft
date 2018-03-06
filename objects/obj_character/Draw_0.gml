/// @description Insert description here
// You can write your code in this editor

draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, c_white, 1.0);

if(not is_undefined(holding) and not is_undefined(inventory)) {
	var item = ds_list_find_value(inventory, holding);
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
	draw_sprite(sprite, sprite_subimage, x, y-UNIT+3);
}