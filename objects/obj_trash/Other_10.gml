/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if(not is_undefined(obj_player.holding)) {
	// create confirmation menu instance (create it offscreen)
	select_inst = instance_create_depth(x-200, y-200, depth-1, obj_select);
	scr_debug("Trash menu ", select_inst)
	// push inventory menu into interact stack
	ds_stack_push(global.interact_stack, select_inst);

	select_inst.x_offset = 2 * UNIT;
	select_inst.y_offset = 6.5 * UNIT;
	select_inst.width = 6 * UNIT;
	
	// check plurality
	var room_inventory = obj_control_room_inventory.inventory;
	var room_item = ds_list_find_value(room_inventory, obj_player.holding);
	var qty = ds_map_find_value(room_item, "quantity")
	
	if(qty > 1) {
		scr_menu_add(select_inst.menu_items, 0, "Trash items", scr_inv_delete, obj_player.holding)
	}
	else {
		scr_menu_add(select_inst.menu_items, 0, "Trash item", scr_inv_delete, obj_player.holding)
	}
}
