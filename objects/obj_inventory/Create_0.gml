/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

selected = 0;
inventory_width = 4;
inventory_height = 7;
inventory_offset = 0;
inventory = ds_map_find_value(GAMEDATA, "inventory");
inventory_size = ds_list_size(inventory);

x_offset = 6;
y_offset = 30;
width = inventory_width * UNIT;
height = inventory_height * UNIT;

inventory_details = instance_create_depth(x, y, depth-1, obj_inventory_details);
