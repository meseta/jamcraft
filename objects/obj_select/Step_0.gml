/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event

var menu_size = ds_list_size(menu_items);

// todo: submenu
/*if(select_right) {
    selected += 1;
}
if(select_left) {
	selected -= 1;
}*/

if(select_down) {
	selected += 1
}
if(select_up) {
	selected -= 1;
}

if(selected < 0) selected = menu_size-1;
else if(selected >= menu_size) selected = 0;

height = menu_size * 10 - 3;

if(interact) {
	scr_debug("Menu selected ", selected);
	var item = ds_list_find_value(menu_items, selected);
	var script = ds_map_find_value(item, "script");
	if(script_exists(script)) {
		scr_debug("Script execute ", script)
		var args = ds_map_find_value(item, "args");
		script_execute(script, args);
	}
	else {
		scr_debug("No script")	
	}
	interact = false;	
}


event_inherited();