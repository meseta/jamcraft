var take_item = argument0;
scr_debug("Take item ", take_item);

with(obj_player) {
	holding = take_item;
}

scr_menu_clear();