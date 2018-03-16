var select_inst = scr_menu_create(obj_select);
select_inst.x_offset = 1 * UNIT;
select_inst.y_offset = 7 * UNIT;
select_inst.width = 8 * UNIT;

if(irandom(100) < 3) {
	scr_menu_add(select_inst.menu_items, 0, "Hadouken 9EP", scr_battle_attack, 9)
}
scr_menu_add(select_inst.menu_items, 0, "Roundhouse 5EP", scr_battle_attack, 5)
scr_menu_add(select_inst.menu_items, 0, "Uppercut 3EP", scr_battle_attack, 3)
scr_menu_add(select_inst.menu_items, 0, "Slap 1EP", scr_battle_attack, 1)