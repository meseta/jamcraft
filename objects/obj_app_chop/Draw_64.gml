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
	draw_sprite_ext(spr_start_animation, frame, x_offset + width/2, y_offset-UNIT+height/2, scale, scale, 0, c_white, 1.0);
}
else if(not end_condition) {
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	
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
else {
	draw_set_color(c_gray);
	draw_set_font(fnt_default);
	draw_set_halign(fa_center);
	draw_set_valign(fa_top);
	
	var accuracy = round(100*(stats_perfect + stats_good/2 + stats_ok/4)/stats_buttons)
	draw_text(x_offset+width/2, y_offset-UNIT+2, "ACCURACY:");
	draw_text(x_offset+width/2, y_offset-UNIT+12, string(accuracy) + "%")
	
	draw_set_color(c_black);
	draw_text(x_offset+width/2, y_offset-UNIT+22, ">BACK ");
}