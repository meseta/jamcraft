/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();
menu_items = ds_list_create();

scr_menu_add(menu_items, 0, "Back", scr_menu_back, noone);

selected = 0;
width = 5 * UNIT -1;

additional_display = noone;