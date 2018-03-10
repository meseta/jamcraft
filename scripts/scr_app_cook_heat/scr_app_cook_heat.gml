var heat_type = argument0;

var menu_inst = scr_menu_create(obj_select);
menu_inst.parent = parent;
scr_debug("Heat menu ", menu_inst)

menu_inst.x_offset = 6.5 * UNIT;
menu_inst.width = 3 * UNIT;

switch(heat_type) {
	case 0: // auto on
		break;
	case 1: //on/off
		scr_menu_add(menu_inst.menu_items, 0, "On", scr_app_cook_heat_set, 2)
		scr_menu_add(menu_inst.menu_items, 0, "Off", scr_app_cook_heat_set, 0)
		menu_inst.y_offset = 7 * UNIT - 20;
		break;
	
	case 2: //hi/low/off
		scr_menu_add(menu_inst.menu_items, 0, "High", scr_app_cook_heat_set, 3)
		scr_menu_add(menu_inst.menu_items, 0, "Low", scr_app_cook_heat_set, 1)
		scr_menu_add(menu_inst.menu_items, 0, "Off", scr_app_cook_heat_set, 0)
		menu_inst.y_offset = 7 * UNIT - 30;
		break;
	
	case 3: // hi/med/low/off
		scr_menu_add(menu_inst.menu_items, 0, "High", scr_app_cook_heat_set, 4)
		scr_menu_add(menu_inst.menu_items, 0, "Med", scr_app_cook_heat_set, 2)
		scr_menu_add(menu_inst.menu_items, 0, "Low", scr_app_cook_heat_set, 1)
		scr_menu_add(menu_inst.menu_items, 0, "Off", scr_app_cook_heat_set, 0)
		menu_inst.y_offset = 7 * UNIT - 40;
	
	default:
	case 4: // 0-5
		scr_menu_add(menu_inst.menu_items, 0, "5", scr_app_cook_heat_set, 5)
		scr_menu_add(menu_inst.menu_items, 0, "4", scr_app_cook_heat_set, 4)
		scr_menu_add(menu_inst.menu_items, 0, "3", scr_app_cook_heat_set, 3)
		scr_menu_add(menu_inst.menu_items, 0, "2", scr_app_cook_heat_set, 2)
		scr_menu_add(menu_inst.menu_items, 0, "1", scr_app_cook_heat_set, 1)
		scr_menu_add(menu_inst.menu_items, 0, "Off", scr_app_cook_heat_set, 0)
		menu_inst.y_offset = 7 * UNIT - 60;
}



