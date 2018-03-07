/// @description Insert description here
// You can write your code in this editor

if(delete_animate) {
	image_speed = 1;
	if(image_index >= image_number-1) {
		instance_destroy();
	}	
}
else {
	event_inherited();
}