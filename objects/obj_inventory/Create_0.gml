/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

selected = 0;
inventory_width = 4;
inventory_height = 7;
inventory_offset = 0;

x_offset = 6;
y_offset = 30;
width = inventory_width * UNIT;
height = inventory_height * UNIT;

inventory_details = instance_create_depth(x-300, y-300, depth+1, obj_inventory_details);
inventory_details.x_offset = -300;
inventory_details.y_offset = -300;

inventory = ds_map_find_value(GAMEDATA, "inventory");
inventory_map = undefined;

selected_x = 0;
selected_y = 0;

option_take = false
option_rearrange = false
