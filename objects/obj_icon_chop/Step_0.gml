/// @description Insert description here
// You can write your code in this editor

event_inherited()

if(not is_undefined(slash)) {
	slash_frame += 0.5;
	
	if(not slash_emit) {
		slash_emit = true
		
		if(not is_undefined(part_color)) { // get particle color
			part_particles_create_color(partexplode_sys, x_offset+UNIT, y_offset, partexplode, part_color, 15);
		}
	}
	
	if(slash_frame >= sprite_get_number(spr_slash)) {
		slash_frame = 0;
		slash = undefined;
		slash_emit = false;
	}
}

if(explode) {
	explode_frame += 0.5;
	if(explode_frame >= sprite_get_number(spr_explosion)) {
		explode_frame = 0;
		explode = false;
	}	
	
}