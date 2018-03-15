/// @description Insert description here
// You can write your code in this editor

if(start_animation < 4*start_animation_speed) {
	start_animation += 1;
	
	select_up = false;
	select_right = false;
	select_down = false;
	select_left = false;
	interact = false;
}
else if(not end_condition) {
	if(blackout) blackout -= 1;
	
	// check keyboard
	var hit = false;
	var miss = false;
	if(select_right) {
		if(button == 0 and blackout == 0) hit = true;
		else miss = true;
	}
	if(select_up) {
		if(button == 1 and blackout == 0) hit = true;
		else miss = true;
	}
	if(select_left) {
		if(button == 2 and blackout == 0) hit = true;
		else miss = true;
	}
	if(select_down) {
		if(button == 3 and blackout == 0) hit = true;
		else miss = true;
	}
		
	// make miss and hit
	if(miss) {
		shake = 5;
		stats_misses += 1;
		button += choose(1, 2, 3);
		rotate_dir = choose(-1, 1);
		blackout = irandom_range(15, 45);
	}
	else if(hit) {
		stats_hits += 1;
		var xx = x_offset+width/2 + lengthdir_x(12, button*90);
		var yy = y_offset-UNIT+height/2 + lengthdir_y(12, button*90);
		part_particles_create(partexplode_sys, xx, yy, partexplode, 15)	
		button += rotate_dir;
		
		if(stats_hits % 4 == 0) {
			display.shake = 5;
			display.swish = clamp(rotate_dir, 0, 1);
			var item = ds_list_find_value(obj_control_room_inventory.inventory, item_idx	);
			var stir_level = ds_map_find_value(item, "stir")
			stir_level = clamp(stir_level-5, 0, 100);
			ds_map_replace(item, "stir", stir_level);
		}
	}
	if(button >= 4) button -= 4;
	if(button < 0) button += 4;
	select_up = false;
	select_right = false;
	select_down = false;
	select_left = false;
	
	
	// particles
	if(blackout == 0) {
		var dtheta = clamp(angle_difference(button*90, virtual_angle), -10, 10);
		virtual_angle = (virtual_angle + dtheta) % 360;
	
		var xx = x_offset+width/2
		var yy = y_offset-UNIT+height/2;
		part_type_direction(partstars, virtual_angle-22.5, virtual_angle+22.5, 0, 0);
		var life = 60;
		if(abs(angle_difference(virtual_angle, 90) < 45) or abs(angle_difference(virtual_angle, 270)) < 45) life = 30
		part_type_life(partstars, life, life);
		part_particles_create(partstars_sys, xx+irandom_range(-3, 3), yy+irandom_range(-3, 3), partstars, 1)	
	}
	
	if(interact) {
		end_condition = true;
		interact = false;
	}
	
}
else { // end condition
	if(interact) cancel = true;
}

event_inherited();