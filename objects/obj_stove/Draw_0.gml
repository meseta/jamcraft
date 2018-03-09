/// @description 

// Inherit the parent event
event_inherited();

if(not is_undefined(stir_level)) {
	if(stir_level < 90 or floor(flasher/15) % 4 != 0) {
		scr_draw_bar(x, y-2*UNIT, UNIT, UNIT*stir_level/100, spr_stir_bar);
	}
	if(max_done < 90 or floor(flasher/15) % 4 != 0) {
		scr_draw_2bar(x, y-2*UNIT+4, UNIT, UNIT*min_done/100, UNIT*max_done/100, spr_done_2bar);
	}
}