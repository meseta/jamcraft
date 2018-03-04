/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

selected = 0;
inventory_width = 6;
inventory_height = 2;
inventory_offset = 0;
inventory = ds_map_find_value(GAMEDATA, "inventory");
inventory_size = ds_list_size(inventory);