/// @description 

scr_debug("Interact with ", object_get_name(object_index))

if(not is_undefined(obj_player.holding) and is_undefined(holding)) {
	// player has item, counter empty: place item on counter
	holding = obj_player.holding
	obj_player.holding = undefined;	
}
else if(is_undefined(obj_player.holding) and not is_undefined(holding)) {
	// counter has item, player empty: take item from counter
	obj_player.holding = holding;
	holding = undefined

}
else if(not is_undefined(obj_player.holding) and not is_undefined(holding)) {
	var item_player = ds_list_find_value(obj_control_room_inventory.inventory, obj_player.holding)
	var item_counter = ds_list_find_value(obj_control_room_inventory.inventory, holding)
	if(scr_lib_property(item_counter, PROPS.jar) and scr_lib_property(item_player, PROPS.cookware)) { // cookware to cookware
		select_inst = scr_menu_create(obj_select);
		select_inst.parent = id
		select_inst.x_offset = 2 * UNIT;
		select_inst.y_offset = 7 * UNIT;
		select_inst.width = 6 * UNIT;
		
		scr_menu_add(select_inst.menu_items, 0, "Fill jar", scr_app_cook_combine, obj_player.holding)
		
		// creat icon
		icon_inst = instance_create_depth(x-200, y-200, depth-1, obj_icon_trash);
		icon_inst.item_idx = holding;
	
		select_inst.additional_display = icon_inst;
	}
	else { // swap item
		var tmp_holding = holding;
		holding = obj_player.holding
		obj_player.holding = tmp_holding;
		heat_level = 0;
	}
}
