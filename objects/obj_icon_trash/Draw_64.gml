/// @description Insert description here
// You can write your code in this editor

event_inherited()
if(cancel) exit;

if(not is_undefined(item_idx)) {
	var item = ds_list_find_value(obj_control_room_inventory.inventory, item_idx);
	scr_item_draw(item, x_offset+UNIT/2, y_offset+UNIT/2);
}

if(delete_animate) {
	draw_sprite(sprite_index, image_index, x_offset+UNIT/2, y_offset+UNIT/2	);	
}