/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

item_idx = undefined;
display = noone;

start_animation = 0;
start_animation_speed = 30;
end_condition = false;

buttons = ds_list_create();

scroll_speed = 0.5;
scroll_timer = 0;
spawn_delay = 45;
next_spawn = 0;

goodness = 0;
goodness_position = 67;

randval = 0;
shake = 0;

stats_buttons = 0;
stats_hits = 0;
stats_perfect = 0;
stats_good = 0;
stats_ok = 0;

partexplode_sys = part_system_create();
part_system_automatic_draw(partexplode_sys, false);
partexplode = part_type_create();
part_type_shape(partexplode, pt_shape_pixel);
part_type_size(partexplode, 1, 1, 0, 0);
part_type_color1(partexplode, $F0AE00);
part_type_speed(partexplode, 0.4, 0.6, 0, 0);
part_type_direction(partexplode, 0, 359, 0, 0);
part_type_gravity(partexplode, 0, 270);
part_type_life(partexplode, 10, 20);
//part_type_blend(partexplode, true);

partstars_sys = part_system_create();
part_system_automatic_draw(partstars_sys, false);
partstars = part_type_create();
part_type_shape(partstars, pt_shape_pixel);
part_type_size(partstars, 1, 1, 0, 0);
part_type_color1(partstars, $ececec);
part_type_speed(partstars, 1, 1, 0, 0);
part_type_direction(partstars, 180, 180, 0, 0);
part_type_gravity(partstars, 0, 270);
part_type_life(partstars, 75, 75);