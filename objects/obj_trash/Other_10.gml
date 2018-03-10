/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if(not is_undefined(obj_player.holding)) {
// create confirmation menu instance (create it offscreen)
	menu_inst = scr_menu_create(obj_select);
	scr_debug("Trash menu ", menu_inst)
	menu_inst.x_offset = 2 * UNIT;
	menu_inst.y_offset = 6.5 * UNIT;
	menu_inst.width = 6 * UNIT;
	
	// check plurality
	scr_menu_add(menu_inst.menu_items, 0, "Trash item", scr_app_trash, obj_player.holding)
	
	disp_inst = instance_create_depth(x-200, y-200, depth-1, obj_icon_trash);
	disp_inst.item_idx = obj_player.holding;
	menu_inst.additional_display = disp_inst;
}
