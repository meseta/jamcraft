/// @description 

// Inherit the parent event
event_inherited();

draw_set_color(c_black);
draw_set_font(fnt_default);
draw_set_halign(fa_left);
draw_set_valign(fa_top);

draw_text(x_offset+4.5*UNIT, y_offset-UNIT+3, "HP: ")
var hp_frac = ds_map_find_value(GAMEDATA, "hp")/ds_map_find_value(GAMEDATA, "hp_max")
scr_draw_bar(x_offset+4.5*UNIT+25, y_offset-UNIT+3, 50, hp_frac*50, spr_cond_bar);

draw_text(x_offset+4.5*UNIT, y_offset-UNIT+13, "EP: ")
var energy_frac = ds_map_find_value(GAMEDATA, "energy")/ds_map_find_value(GAMEDATA, "energy_max")
scr_draw_bar(x_offset+4.5*UNIT+25, y_offset-UNIT+13, 50, energy_frac*50, spr_cond_bar);

var stat_list = ds_map_find_value(GAMEDATA, "status_effects");
var xpos = 0;
for(var i=0; i<ds_list_size(stat_list); i++) {
	var stat = ds_list_find_value(stat_list, i);

	if(not is_undefined(stat) and stat > 0) {
		draw_sprite(spr_effects, i, x_offset+8.5*UNIT+xpos, y_offset-UNIT+30);
		xpos -= 12;	
	}
}
