/// @description 

// Inherit the parent event
event_inherited();

draw_set_color(c_black);
draw_set_font(fnt_default);
draw_set_valign(fa_top);

draw_set_halign(fa_center);
draw_text(x_offset+width/2, y_offset-UNIT+2, name)


draw_set_halign(fa_left);
draw_text(x_offset, y_offset-UNIT+13, "HP: ")
scr_draw_bar(x_offset+25, y_offset-UNIT+13, 35, hp_frac*35, spr_stir_bar);

draw_text(x_offset+4.5*UNIT-5, y_offset-UNIT+13, "COND: ")
scr_draw_bar(x_offset+4.5*UNIT+35, y_offset-UNIT+13, 35, cond_frac*35, spr_stir_bar);

