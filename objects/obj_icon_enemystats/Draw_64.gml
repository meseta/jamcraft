/// @description 

// Inherit the parent event
event_inherited();

draw_set_color(c_black);
draw_set_font(fnt_default);
draw_set_valign(fa_top);

draw_set_halign(fa_center);
var str_w = string_width(enemy_name);
draw_text(x_offset+width/2-20, y_offset-UNIT+2, enemy_name)

// stars
for(var i=0; i<5; i+=1) {
	if(stars > i) {
		draw_sprite(spr_star, 0, x_offset+(width+str_w)/2-18+i*9, y_offset-UNIT+7);
	}
	else {
		draw_sprite(spr_star, 1, x_offset+(width+str_w)/2-18+i*9, y_offset-UNIT+7);
	}
}

draw_set_halign(fa_left);
draw_text(x_offset, y_offset-UNIT+13, "HP: ")
scr_draw_bar(x_offset+25, y_offset-UNIT+13, 35, hp_frac*35, spr_stir_bar);

draw_text(x_offset+4.5*UNIT-5, y_offset-UNIT+13, "COND: ")
scr_draw_bar(x_offset+4.5*UNIT+35, y_offset-UNIT+13, 35, cond_frac*35, spr_stir_bar);

