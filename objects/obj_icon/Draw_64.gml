/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if(cancel) exit;

if(not is_undefined(item_idx)) {
	var item = ds_list_find_value(obj_control_room_inventory.inventory, item_idx);
	scr_inv_draw(item, x_offset, y_offset);
}