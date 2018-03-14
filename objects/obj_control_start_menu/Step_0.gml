/// @description 

if(not instance_exists(select_inst)) {
	select_inst = scr_menu_create(obj_select);
	select_inst.x_offset = 2 * UNIT;
	select_inst.y_offset = 7 * UNIT;
	select_inst.width = 6 * UNIT;
		
	scr_menu_add(select_inst.menu_items, 0, "Exit", scr_exit, noone)
	scr_menu_add(select_inst.menu_items, 0, "Load Game", scr_load, noone)
	scr_menu_add(select_inst.menu_items, 0, "New Game", scr_newgame, noone)
}