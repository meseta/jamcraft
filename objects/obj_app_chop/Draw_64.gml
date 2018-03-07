/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if(cancel) exit;

if(start_animation < 4*start_animation_speed) {
	var frame = start_animation div start_animation_speed;
	var sub = start_animation mod start_animation_speed;
	var scale = 1;
	if(sub > start_animation_speed/2) {
		scale = 2*(1-(sub/start_animation_speed));
	}
	draw_sprite_ext(spr_start_animation, frame, x_offset + width/2, y_offset, scale, scale, 0, c_white, 1.0);
}
else {
	var goodness = 0;	
	
	draw_sprite(spr_timing_bar, goodness, x_offset + width/2, y_offset + height/2 - UNIT)
}