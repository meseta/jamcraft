/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

menu_items = ds_list_create();

var item = ds_map_create();
ds_map_add(item, "text", "Back");
ds_map_add(item, "script", scr_menu_back);
ds_list_add(menu_items, item)
ds_list_mark_as_map(menu_items, ds_list_size(menu_items)-1);

menu_size = ds_list_size(menu_items);

selected = 0;
width = 5 * UNIT -1;
text_maxlength = 10