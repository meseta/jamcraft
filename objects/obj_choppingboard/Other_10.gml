/// @description Insert description here
// You can write your code in this editor

scr_debug("Interact with ", object_get_name(object_index))

if(not is_undefined(obj_player.holding) and is_undefined(holding)) {
	// player has item, counter empty: place item on counter
	holding = obj_player.holding
	obj_player.holding = undefined;	
}
else if(is_undefined(obj_player.holding) and not is_undefined(holding)) {
	// counter has item, player empty
	var item = ds_list_find_value(obj_control_room_inventory.inventory, holding)
	if(scr_item_property(item, PROPS.choppable)) { // check if choppable
		// create confirmation menu instance (create it offscreen)
	
		select_inst = scr_menu_create(obj_select);
		select_inst.parent = id;
		select_inst.x_offset = 2 * UNIT;
		select_inst.y_offset = 6.5 * UNIT;
		select_inst.width = 6 * UNIT;
		
		scr_menu_add(select_inst.menu_items, 0, "Take", scr_room_inv_take, id)
		scr_menu_add(select_inst.menu_items, 0, "Chop", scr_app_chop, holding)
		
		// creat icon
		icon_inst = instance_create_depth(x-200, y-200, depth-1, obj_icon_chop);
		icon_inst.item_idx = holding;
	
		select_inst.additional_display = icon_inst;
	}
	else {
		// take
		obj_player.holding = holding;
		holding = undefined
	}

}
else if(not is_undefined(obj_player.holding) and not is_undefined(holding)) {
	// counter has item, player has item: swap items
	var tmp_holding = holding;
	holding = obj_player.holding
	obj_player.holding = tmp_holding;
}
