/// @description Insert description here
// You can write your code in this editor

if(delete_animate) {
	delete_frame += 0.5;
	if(delete_frame >= sprite_get_number(spr_explosion)) {
		instance_destroy();
	}	
}
else {
	event_inherited();
}