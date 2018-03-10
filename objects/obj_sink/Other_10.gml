/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
scr_debug("Interact with ", object_get_name(object_index))

if(not is_undefined(obj_player.holding) and is_undefined(holding)) {
	// player has item, counter empty
	
	var item = ds_list_find_value(obj_control_room_inventory.inventory, obj_player.holding)
	if(scr_lib_property(item, PROPS.container)) { // check if container
		// create confirmation menu instance (create it offscreen)
		select_inst = scr_menu_create(obj_select);
		select_inst.x_offset = 2 * UNIT;
		select_inst.y_offset = 6.5 * UNIT;
		select_inst.width = 6 * UNIT;
		
		scr_menu_add(select_inst.menu_items, 0, "Place", scr_room_inv_place, id)
		scr_menu_add(select_inst.menu_items, 0, "Empty", scr_app_sink_empty, obj_player.holding)
		
		// creat icon
		icon_inst = instance_create_depth(x-200, y-200, depth-1, obj_icon_trash);
		icon_inst.item_idx = obj_player.holding;
	
		select_inst.additional_display = icon_inst;
	}
	else {
		// place
		holding = obj_player.holding
		obj_player.holding = undefined;	
	}
	
	
}
else if(is_undefined(obj_player.holding) and not is_undefined(holding)) {
	// counter has item, player empty: take item from counter
	obj_player.holding = holding;
	holding = undefined
}
else if(not is_undefined(obj_player.holding) and not is_undefined(holding)) {
	// counter has item, player has item, swap
	var tmp_holding = holding;
	holding = obj_player.holding
	obj_player.holding = tmp_holding;
}
