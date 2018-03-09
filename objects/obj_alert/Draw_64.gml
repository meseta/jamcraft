/// @description 

// Inherit the parent event
event_inherited();

if(cancel) exit;


draw_set_color(c_black);
draw_set_font(fnt_default);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

draw_text_ext(x_offset+width/2, y_offset+height/2-UNIT+2, text, 10, width);