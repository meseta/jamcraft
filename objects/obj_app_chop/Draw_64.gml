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
else if(not end_condition) {
	part_system_drawit(partstars_sys);
	
	// draw buttons
	for(var i=0; i<ds_list_size(buttons); i++) {
		var button = ds_list_find_value(buttons, i);
		var position = ds_map_find_value(button, "position");
		var type = ds_map_find_value(button, "type");
		var xx = x_offset+width-10-position
		var yy = y_offset+height/2-UNIT + dcos(scroll_timer+position*3)*2
		draw_sprite(spr_timing_buttons, type, xx, yy);
	}
	
	part_system_drawit(partexplode_sys);
	
	// draw frame
	var xx = x_offset + width/2;
	var yy = y_offset + height/2 - UNIT
	
	if(shake > 0) {
		shake -= 1;
		xx += choose(-1, 0, 1);
		yy += choose(-1, 0, 1);
	}
	draw_sprite(spr_timing_bar, goodness, xx, yy)
}