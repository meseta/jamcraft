/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

draw_set_color(c_black);
draw_set_font(fnt_default);
draw_set_halign(fa_left);
draw_set_valign(fa_top);

for(var i=0; i<menu_size; i++) {
	var item = ds_list_find_value(menu_items, i);
	
	// calculate position
	var xx = x_offset;
	var yy = i * 10 + y_offset - 15;
	var text_limit = string_copy(ds_map_find_value(item, "text"), 1, text_maxlength-1)
	if(i == selected) {	
		draw_text(xx, yy, ">" + text_limit);
	}
	else {
		draw_text(xx, yy, " " + text_limit);
	}
}