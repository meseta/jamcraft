/// @description Insert description here
// You can write your code in this editor

event_inherited();

move_is_moving = false;
move_dir = MOVEDIR.undef;
move_last_dir = MOVEDIR.undef;

move_target_x = x;
move_target_y = y;

image_index = 0;
image_speed = 0;

mask_index = spr_solid; // object mask is in fact the full tile