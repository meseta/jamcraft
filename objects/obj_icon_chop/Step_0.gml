/// @description Insert description here
// You can write your code in this editor

event_inherited()

if(not is_undefined(slash)) {
	slash_frame += 0.5;
	
	if(not slash_emit) {
		slash_emit = true
		part_particles_create_color(partexplode_sys, x_offset+UNIT, y_offset, partexplode, c_red, 15)	
	}
	
	if(slash_frame >= sprite_get_number(spr_slash)) {
		slash_frame = 0;
		slash = undefined;
		slash_emit = false;
	}
}