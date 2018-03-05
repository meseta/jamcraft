/// @description Insert description here

// Inherit the parent event
event_inherited();

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
	scr_debug("Inventory menu")
	// create inventory instance (create it offscreen)
	menu_inst = instance_create_depth(x-200, y-200, depth-1, obj_menu_select);
	// push inventory menu into interact stack
	ds_stack_push(global.interact_stack, menu_inst);

	// add items into menu
	menu_inst.x_offset = selected_x + UNIT + 4;
	menu_inst.y_offset = selected_y;
	
	interact = false;
}