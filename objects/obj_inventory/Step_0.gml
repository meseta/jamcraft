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
	// create inventory instance (create it offscreen)
	select_inst = instance_create_depth(x-200, y-200, depth-1, obj_select);
	scr_debug("Select menu ", select_inst)
	// push inventory menu into interact stack
	ds_stack_push(global.interact_stack, select_inst);

	select_inst.x_offset = selected_x + UNIT + 4;
	select_inst.y_offset = selected_y;
	
	// add items into menu
	if(option_take) {
		// select item
		if(is_undefined(inventory_map)) {
			var inv_index = selected
		}
		else {
			var inv_index = ds_list_find_value(inventory_map, selected);
		}
		
		if(is_undefined(obj_player.holding)) {
			var item = ds_map_create();
			ds_map_add(item, "text", "Take");
			ds_map_add(item, "script", scr_menu_take);
			ds_map_add(item, "args", inv_index);
			ds_list_insert(select_inst.menu_items, 0, item)
			ds_list_mark_as_map(select_inst.menu_items, ds_list_size(select_inst.menu_items)-1);
			select_inst.menu_size = ds_list_size(select_inst.menu_items);
		}
	}
	
	interact = false;
}