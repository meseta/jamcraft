/// @description 

if(not is_undefined(holding)) {
	var item = ds_list_find_value(obj_control_room_inventory.inventory, holding)
	if(scr_lib_property(item, PROPS.cookware)) {
		
		// set auto-heat
		if(heat_type == 0) {
			heat_level = 2;		
		}
		
		// get stir
		stir_level = ds_map_find_value(item, "stir")
		if(is_undefined(stir_level)) {
			stir_level = 0;
			ds_map_add(item, "stir", 0);
		}
		
		// add to stir depending on heat level
		stir_level = clamp(stir_level+heat_level/50, 0, 100);
		ds_map_replace(item, "stir", stir_level);
		
		// get doneness
		min_done = undefined;
		max_done = undefined;
		
		var contents = ds_map_find_value(item, "contents");
		if(is_undefined(contents)) {	
			ds_map_add_list(item, "contents", ds_list_create());
			contents = ds_map_find_value(item, "contents");
		}
		
		for(var i=0; i<ds_list_size(contents); i++) {
			var content = ds_list_find_value(contents, i);
			var item_type = ds_map_find_value(content, "type");	
			var item_name = scr_lib_lookup(content, "name")

			if(item_type == ITEM.mush) continue;
				
			var doneness = ds_map_find_value(content, "doneness");
			if(is_undefined(doneness)) {
				ds_map_add(content, "doneness", 0);
				doneness = 0;
			}
			
			var cook_rate = scr_lib_cook_rate(content);
			var cook_input = (heat_level/30) * (max(stir_level, 35)-35)/65;
			
			doneness += cook_input * cook_rate;
			ds_map_replace(content, "doneness", doneness);
			
			if(is_undefined(min_done) or doneness < min_done) min_done = doneness;
			if(is_undefined(max_done) or doneness > max_done) max_done = doneness;
			
			if(doneness > 133) {
				if(not is_undefined(item_name)) {
					audio_play_sound(snd_fx_burn, 20, false);
					scr_alert(item_name + " overcooked!");
				}
				
				ds_map_replace(content, "type", ITEM.mush)
				ds_map_replace(content, "subtype", SUBTYPE.trash);
				ds_map_replace(content, "doneness", 100);
				
				// recalculate pot color
				var new_color = scr_inv_calculate_color(contents);
				ds_map_replace(item, "content_color", new_color);
			}
			
			
			var condition = ds_map_find_value(content, "condition");
			
			if(stir_level >= 99) {
				condition = clamp(condition-heat_level/30, 0, 100);
				ds_map_replace(content, "condition", condition);
				

				if(condition <= 0) {
					if(not is_undefined(item_name)) {
						
						audio_play_sound(snd_fx_burn, 20, false);

						scr_alert(item_name + " burned!");
					}
					
					ds_map_replace(content, "type", ITEM.mush)
					ds_map_replace(content, "subtype", SUBTYPE.trash);
					ds_map_replace(content, "doneness", 100);
					
					// recalculate pot color
					var new_color = scr_inv_calculate_color(contents);
					ds_map_replace(item, "content_color", new_color);
				}
			}
		}
		
		if(is_undefined(min_done)) min_done = 0;
		if(is_undefined(max_done)) max_done = 0;
		min_done = min(100, min_done);
		max_done = min(100, max_done);
		
		// sounds
		if((stir_level >= 90 or max_done >= 90) and alarm[0] == -1) {
			alarm[0] = 60;
		}
	}
	else {
		stir_level = undefined	
	}
}
else {
	heat_level = 0;
	stir_level = undefined
}

image_index = heat_level;
flasher += 1;