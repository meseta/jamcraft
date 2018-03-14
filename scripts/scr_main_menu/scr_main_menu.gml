if(room != rm_battle and room != rm_sleep) {
	var select_inst = scr_menu_create(obj_select);
	select_inst.x_offset = 0.5 * UNIT - 2;
	select_inst.y_offset = 7 * UNIT;
	select_inst.width = 4 * UNIT;

	scr_menu_add(select_inst.menu_items, 0, "Items", scr_inventory_use, noone)
	scr_menu_add(select_inst.menu_items, 0, "Save", scr_save, noone)
	
	// creat icon
	var icon_inst = instance_create_depth(x-200, y-200, depth-1, obj_icon_playerstats);
	icon_inst.show_money = true;
	select_inst.additional_display = icon_inst;
}