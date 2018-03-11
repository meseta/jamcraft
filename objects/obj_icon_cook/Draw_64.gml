/// @description Insert description here
// You can write your code in this editor

event_inherited()

if(cancel) exit;

if(not is_undefined(item_idx)) {
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	
	var item_pot = ds_list_find_value(obj_control_room_inventory.inventory, item_idx);

	// draw pot contents
	var contents = ds_map_find_value(item_pot, "contents") 
	var min_done = undefined;
	var max_done = undefined;
	
	var capacity = scr_get_capacity(item_pot);
	var i_offset = 0;
	if(capacity <= inventory_width) {
		i_offset = inventory_width + floor((inventory_width-capacity)/2);
	}
	
	// inventory contents
	for(var i=0; i<i_offset+inventory_width*inventory_height and i<capacity; i++) {
		draw_set_color(c_white)
	
		// calculate position
		var row = (i+i_offset) div inventory_width;
		var col = (i+i_offset) mod inventory_width;
		var xx = col * UNIT + x_offset;
		var yy = row * (UNIT + 4) + y_offset + UNIT + 6;
	
		// draw inventory slot
		draw_sprite(spr_inventory_slot, 0, xx, yy);
	
		// select item
		var item = ds_list_find_value(contents, i);
		if(not is_undefined(item)) {
			scr_item_draw(item, xx, yy);
			
			var item_type = ds_map_find_value(item, "type");
			var doneness = ds_map_find_value(item, "doneness");
			if(is_undefined(doneness)) doneness = 0;
			if(item_type != ITEM.mush and (doneness < 90 or floor(flasher/15) % 3 != 2)) {
				scr_draw_2bar(xx+3, yy-1, UNIT-5, doneness*(UNIT-5)/100, doneness*(UNIT-5)/100, spr_done_2bar);
			}
			
			if(is_undefined(min_done) or doneness < min_done) min_done = doneness;
			if(is_undefined(max_done) or doneness > max_done) max_done = doneness;
		}
	}
	
	if(is_undefined(min_done)) min_done = 0;
	if(is_undefined(max_done)) max_done = 0;
	min_done = min(100, min_done);
	max_done = min(100, max_done);
	
	// draw pot
	var xx = x_offset+UNIT/2;
	var yy = y_offset+UNIT/4;
	if(shake > 0) {
		shake -= 1;
		xx += choose(-1, 0, 1);
		yy += choose(-1, 0, 1);
	}
	scr_item_draw(item_pot, xx, yy);
	var stir_level = ds_map_find_value(item_pot, "stir")
	
	draw_set_color(c_gray);
			
	draw_text(x_offset+2*UNIT, y_offset-UNIT+3, "STIR")
	draw_text(x_offset+2*UNIT, y_offset-UNIT+13, "DONE")
	
	if(stir_level < 90 or floor(flasher/15) % 3 != 0) {
		scr_draw_bar(x_offset+2*UNIT+38, y_offset-UNIT+3, 40, stir_level*40/100, spr_stir_bar);
	}
	
	if(max_done < 90 or floor(flasher/15) % 3 != 0) {
		scr_draw_2bar(x_offset+2*UNIT+38, y_offset-UNIT+13, 40, min_done*40/100, max_done*40/100, spr_done_2bar);
	}
	
	// swish
	if(not is_undefined(swish)) {
		switch(swish) {
			case 0:
				draw_sprite_ext(spr_swish, floor(swish_frame), x_offset+UNIT, y_offset-UNIT/4, -1, 1, 0, c_white, 1.0);
				break;
			case 1:
				draw_sprite_ext(spr_swish, floor(swish_frame), x_offset+UNIT, y_offset-UNIT/4, 1, 1, 0, c_white, 1.0);
				break;
		}	
	}
}