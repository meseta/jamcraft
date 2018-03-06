/// @description Insert description here

event_inherited();
if(cancel) exit

// Inherit the parent event
if(is_undefined(inventory_map)) {
	var inventory_size = ds_list_size(inventory);
}
else {
	var inventory_size = ds_list_size(inventory_map);
}

if(select_right) {
	selected += 1;
}
if(select_left) {
	selected -= 1;
}
if(select_down) {
	selected += inventory_width
}
if(select_up) {
	selected -= inventory_width;
}

if(selected < 0) selected = 0;
else if(selected >= inventory_size) selected = inventory_size-1;

if(selected < inventory_offset) { // scroll down
	inventory_offset -= inventory_width;
}
if(selected >= inventory_offset + inventory_width * inventory_height) {
	inventory_offset += inventory_width;	
}

if(interact) {
	// create inventory instance (create it offscreen)
	select_inst = instance_create_depth(x-200, y-200, depth-1, obj_select);
	scr_debug("Select menu ", select_inst)
	// push inventory menu into interact stack
	ds_stack_push(global.interact_stack, select_inst);

	select_inst.x_offset = selected_x + UNIT + 4;
	select_inst.y_offset = selected_y;
	
	// add items into menu
	//if(option_take) {
		// select item
		if(is_undefined(inventory_map)) {
			var inv_index = selected
		}
		else {
			var inv_index = ds_list_find_value(inventory_map, selected);
		}
		
		if(is_undefined(obj_player.holding)) {
			scr_menu_add(select_inst.menu_items, 0, "Take", scr_inv_takeout, inv_index);
		}
	//}
	
	interact = false;
}