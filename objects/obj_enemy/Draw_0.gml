/// @description 

draw_sprite(sprite_index, image_number, x+xoff, y+yoff);

if(animate_hit_counter > 0 and animate_hit_counter < 20) {
	var animation_frame = floor((20-animate_hit_counter)/2);
	switch(animate_hit_type) {
		case 0:
			if(animation_frame <= sprite_get_number(spr_slash)) draw_sprite_ext(spr_slash, animation_frame, x+2.5*UNIT, y-1.5*UNIT, 1, -1, 0, c_white, 1.0);
			break;
		case 1:
			if(animation_frame <= sprite_get_number(spr_slash)) draw_sprite_ext(spr_slash, animation_frame, x+2.5*UNIT, y-1.5*UNIT, -1, -1, 0, c_white, 1.0);
			break;
		case 2:
			if(animation_frame <= sprite_get_number(spr_slash)) draw_sprite_ext(spr_slash, animation_frame, x+2.5*UNIT, y-1.5*UNIT, -1, 1, 0, c_white, 1.0);
			break;
		case 3:
			if(animation_frame <= sprite_get_number(spr_slash)) draw_sprite_ext(spr_slash, animation_frame, x+2.5*UNIT, y-1.5*UNIT, 1, 1, 0, c_white, 1.0);
			break;
		case 4:
		case 5:
			if(animation_frame <= sprite_get_number(spr_slash)) draw_sprite_ext(spr_slash, animation_frame, x+2.5*UNIT, y-1.5*UNIT, 1, 1, 0, c_white, 1.0);
			if(animation_frame <= sprite_get_number(spr_slash)) draw_sprite_ext(spr_slash, animation_frame, x+2.5*UNIT, y-1.5*UNIT, 1, 1, 180, c_white, 1.0);
			break;
		case 6:
			if(animation_frame <= sprite_get_number(spr_explosion)) draw_sprite_ext(spr_explosion, animation_frame, x+2.5*UNIT, y-1.5*UNIT, 1, 1, 0, c_white, 1.0)
	}
}