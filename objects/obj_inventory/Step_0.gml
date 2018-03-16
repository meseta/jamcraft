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
	if(can_take or can_use or can_throw) {
		// create inventory instance (create it offscreen)
		select_inst = scr_menu_create(obj_select);
		scr_debug("Select menu ", select_inst)
		select_inst.x_offset = selected_x + UNIT + 4;
		select_inst.y_offset = selected_y;
	
		// add items into menu
		if(is_undefined(inventory_map)) {
			var inv_index = selected
		}
		else {
			var inv_index = ds_list_find_value(inventory_map, selected);
		}
		
		if(can_take) {
			if(is_undefined(obj_player.holding)) {
				scr_menu_add(select_inst.menu_items, 0, "Take", scr_app_takeout, inv_index);
			}
		}
		if(can_use) {
			scr_menu_add(select_inst.menu_items, 0, "Use", scr_item_use, inv_index);
		}
		if(can_throw) {
			scr_menu_add(select_inst.menu_items, 0, "Throw", scr_battle_throw, inv_index);
		}
	}
	
	interact = false;
}