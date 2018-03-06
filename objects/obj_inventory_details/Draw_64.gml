/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

draw_set_color(c_black);
draw_set_font(fnt_default);
draw_set_halign(fa_left);
draw_set_valign(fa_top);

// item name
var text_limit = string_copy(text_name, 1, text_maxlength)
draw_text(x_offset, y_offset-UNIT+1, text_limit)

// item type
draw_set_color(c_gray);
var subtype_limit = string_copy(text_subtype, 1, text_maxlength)
draw_text(x_offset, y_offset-UNIT+11, subtype_limit)
draw_text(x_offset, y_offset-UNIT+21, "x" + string(text_qtty))
draw_text(x_offset, y_offset-UNIT+31, "COND: " + string(text_cond) + "%")

draw_set_color(c_white);
for(var i=0; i<5; i+=1) {
	if(text_qual >= (i+1)*20) {
		draw_sprite(spr_star, 0, x_offset+i*9+36, y_offset-UNIT+27);
	}
	else {
		draw_sprite(spr_star, 1, x_offset+i*9+36, y_offset-UNIT+27);
	}
}