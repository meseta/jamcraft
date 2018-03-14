/// @description 

var select_inst = scr_menu_create(obj_select);
select_inst.x_offset = 2.5 * UNIT;
select_inst.y_offset = 7 * UNIT;
select_inst.width = 5 * UNIT;

scr_menu_add(select_inst.menu_items, 0, "Cancel", scr_menu_clear, noone)
scr_menu_add(select_inst.menu_items, 0, "Sleep", scr_app_bed, noone)