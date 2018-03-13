/// @description 

draw_sprite(sprite_index, image_number, x, y);

if(not is_undefined(color)) {
	draw_sprite_ext(spr_tree_overlay, image_number, x, y, 1, 1, 0, color, 1.0);
}