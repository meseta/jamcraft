/// @description 

// Inherit the parent event
event_inherited();

flasher += 1;

if(not is_undefined(swish)) {
	swish_frame += 0.5;
	
	if(swish_frame >= sprite_get_number(spr_slash)) {
		swish_frame = 0;
		swish = undefined;
	}
}