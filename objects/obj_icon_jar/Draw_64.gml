/// @description Insert description here
// You can write your code in this editor

event_inherited()

if(cancel) exit;

if(not is_undefined(item_idx)) {
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	
	var item_pot = ds_list_find_value(obj_control_room_inventory.inventory, item_idx);
	var contents = ds_map_find_value(item_pot, "contents") 
		
	if(display_mode == 0) {
		// draw pot contents
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
			if(not is_undefined(contents)) {
				var item = ds_list_find_value(contents, i);
				if(not is_undefined(item)) {
					scr_item_draw(item, xx, yy);
				}
			}
		}
	}
	else {
		draw_set_color(c_gray);
		draw_text(x_offset+0.5*UNIT, y_offset-UNIT+28, "SWT:")
		draw_text(x_offset+0.5*UNIT, y_offset-UNIT+38, "SOUR:")
		draw_text(x_offset+0.5*UNIT, y_offset-UNIT+48, "BTTR:")
		draw_text(x_offset+0.5*UNIT, y_offset-UNIT+58, "SET:")
		draw_text(x_offset+0.5*UNIT, y_offset-UNIT+68, "EFCT:")
		
		
		if(not is_undefined(contents) and ds_list_size(contents) >= 0) {
			
			draw_text(x_offset+5*UNIT, y_offset-UNIT+28, string_format(ds_map_find_value(item_pot, "sweetness"), 3, 0))
			draw_text(x_offset+5*UNIT, y_offset-UNIT+38, string_format(ds_map_find_value(item_pot, "sourness"), 3, 0))
			draw_text(x_offset+5*UNIT, y_offset-UNIT+48, string_format(ds_map_find_value(item_pot, "bitterness"), 3, 0))
			switch(ds_map_find_value(item_pot, "set")) {
				default:
				case SET.runny: var set_text = "RUNNY"; break;
				case SET.good: var set_text = " GOOD"; break;
				case SET.firm: var set_text = " FIRM"; break;
			}
			draw_text(x_offset+4*UNIT, y_offset-UNIT+58, set_text)
			
			var effects = ds_map_find_value(item_pot, "effects");
			var xpos = 0;
			for(var i=0; i<=10; i++) {
				if(effects & (1 << i)) {
					draw_sprite(spr_effects, i, x_offset+6*UNIT+xpos, y_offset-UNIT+74);
					xpos -= 12;	
				}
			}
		}
		
	}
	
	// draw jar
	scr_item_draw(item_pot, x_offset+UNIT/2, y_offset+UNIT/4);
	
	draw_set_color(c_black);
	
	var item_name = scr_lib_lookup(item_pot, "name");
	var quality = ds_map_find_value(item_pot, "quality");
	if(not is_undefined(contents)) {
		if(ds_list_size(contents) > 0) {
			item_name = ds_map_find_value(item_pot, "type_name");
			quality = ds_map_find_value(item_pot, "content_quality");
		}
	}
	draw_text(x_offset+2*UNIT, y_offset-UNIT+3, item_name)
	
	// item type
	draw_set_color(c_gray);
	draw_text(x_offset+2*UNIT, y_offset-UNIT+13, "QUAL ")
	
	draw_set_color(c_white);
	for(var i=0; i<5; i+=1) {
		if(quality >= (i+1)*20) {
			draw_sprite(spr_star, 0, x_offset+2*UNIT+i*9+36, y_offset-UNIT+19);
		}
		else {
			draw_sprite(spr_star, 1, x_offset+2*UNIT+i*9+36, y_offset-UNIT+19);
		}
	}

}