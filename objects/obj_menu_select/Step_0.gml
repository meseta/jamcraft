/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

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

height = menu_size * 10;