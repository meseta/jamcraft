/// @description Insert description here
// You can write your code in this editor

if(select_right) {
    selected += 1;
}
if(select_left) {
	selected -= 1;
}
if(select_down) {
	selected += inventory_width
}
if(select_up) {
	selected -= inventory_width;
}

if(selected < 0) selected = 0;
else if(selected >= inventory_size) selected = inventory_size-1;

if(selected < inventory_offset) { // scroll down
	inventory_offset -= inventory_width;
}
if(selected >= inventory_offset + inventory_width * inventory_height) {
	inventory_offset += inventory_width;	
}

// Inherit the parent event
event_inherited();

