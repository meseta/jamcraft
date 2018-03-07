/// @description Insert description here
// You can write your code in this editor

if(not invisible) {
	draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, c_white, 1.0);
}

if(not is_undefined(holding)) {
	var item = ds_list_find_value(obj_control_room_inventory.inventory, holding);
	scr_item_draw(item, x, y-9);
}