/// @description Insert description here
// You can write your code in this editor

event_inherited()

item_idx = undefined;
width = UNIT*7;
height = UNIT*2;
shake = 0;

x_offset = 1.5 * UNIT;
y_offset = 3.5 * UNIT;

slash = undefined
slash_frame = 0;

explode = false;
explode_frame = 0;

slash_emit = false;
part_color = undefined;

partexplode_sys = part_system_create();
part_system_automatic_draw(partexplode_sys, false);
partexplode = part_type_create();
part_type_shape(partexplode, pt_shape_pixel);
part_type_size(partexplode, 1, 1, 0, 0);
part_type_speed(partexplode, 0.4, 0.6, 0, 0);
part_type_direction(partexplode, 0, 359, 0, 0);
part_type_gravity(partexplode, 0.025, 270);
part_type_life(partexplode, 15, 25);