var heat_type = argument0;


var menu_inst = instance_create_depth(x-200, y-200, depth-1, obj_select);
menu_inst.parent = parent;
scr_debug("Heat menu ", menu_inst)
// push inventory menu into interact stack
ds_stack_push(global.interact_stack, menu_inst);

menu_inst.x_offset = 4 * UNIT;
menu_inst.y_offset = 3 * UNIT;
menu_inst.width = 3 * UNIT;
	
// check plurality
scr_menu_add(menu_inst.menu_items, 0, "Off", scr_app_cook_heat_set, 0)
scr_menu_add(menu_inst.menu_items, 0, "On", scr_app_cook_heat_set, 1)

/*switch(heat_type) {
	case 0: //on/off
	
	
	case 1: //hi/low/off
	
	
	case 2: // hi/med/low/off
	
	
	
	case 3: // 0-5
	
	
}*/



