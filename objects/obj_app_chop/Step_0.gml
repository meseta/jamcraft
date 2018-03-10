/// @description Insert description here
// You can write your code in this editor

if(start_animation < 4*start_animation_speed) {
	start_animation += 1;
	
	select_up = false;
	select_right = false;
	select_down = false;
	select_left = false;
	interact = false;
}
else if(not end_condition) {
	scroll_timer += 1;
	goodness = 0;
	var best_goodness = undefined;
	var best_idx = undefined;
	var best_type = undefined;
	
	var item = ds_list_find_value(obj_control_room_inventory.inventory, item_idx);
	var cond = ds_map_find_value(item, "condition")
	var chop = ds_map_find_value(item, "chop")
	
	// move items and calculate best goodness
	for(var i=ds_list_size(buttons)-1; i>=0; i-=1) { // must run backward to avoid messing with unscanned indexes on delete
		var button = ds_list_find_value(buttons, i);
		var position = ds_map_find_value(button, "position") + scroll_speed;
		
		if(position > 76) { // button goes off screen
			ds_map_destroy(button);
			ds_list_delete(buttons, i);
			stats_buttons += 1;
			
			cond = clamp(cond-1, 0, 100);
			ds_map_set(item, "condition", cond);
		}
		else {
			// check goodness
			var goodness_score = abs(position - goodness_position)
			if(is_undefined(best_goodness) or goodness_score < best_goodness) {
				best_goodness = goodness_score;
				best_idx = i;
				best_type = ds_map_find_value(button, "type");
			}
			
			ds_map_set(button, "position", position);
		}
	}
	
	// handle goodness and input
	if(is_undefined(best_goodness)) goodness = 0;
	else goodness = 3-clamp(floor(best_goodness/2), 0, 3);
	
	if(select_up or select_right or select_down or select_left or interact) {
		stats_hits += 1;
		var hit = false;
		var miss = false;
		if(select_up) {
			if(best_type == 0) hit = true;
			else miss = true;
		}
		if(select_right) {
			if(best_type == 1) hit = true;
			else miss = true;
		}
		if(select_down) {
			if(best_type == 2) hit = true;
			else miss = true;
		}
		if(select_left) {
			if(best_type == 3) hit = true;
			else miss = true;
		}
		if(interact) {
			if(best_type == 4 or best_type == 5) hit = true;
			else miss = true;
		}
		
		if(miss or goodness == 0) {
			shake = 5;
			cond = clamp(cond-5, 0, 100);
			ds_map_set(item, "condition", cond);
		}
		else if(hit and goodness > 0) {
			stats_buttons += 1;
			switch(goodness) {
				case 1: stats_ok += 1; break
				case 2: stats_good += 1; break
				case 3: stats_perfect += 1; break
			}
			
			var button = ds_list_find_value(buttons, best_idx);
			var position = ds_map_find_value(button, "position")
			ds_map_destroy(button);
			ds_list_delete(buttons, best_idx);
			
			var xx = x_offset+width-10-position
			var yy = y_offset+height/2-UNIT + dcos(scroll_timer+position*3)*2
			part_particles_create(partexplode_sys, xx, yy, partexplode, 15*goodness)	
			
			chop = clamp(chop+goodness*2, 0, 100);
			ds_map_set(item, "chop", chop);
			
			if(best_type == 5) {
				cond = clamp(cond+5, 0, 100);
				ds_map_set(item, "condition", cond);
			}
			
			// get particle color
			display.part_color = scr_lib_color(item);
			display.shake = 5;
			display.slash = best_type;
		}
		select_up = false;
		select_right = false;
		select_down = false;
		select_left = false;
		interact = false;
	}
	
	// handle spawning
	if(scroll_timer >= next_spawn) { // spawn a new one
		var button = ds_map_create()
		ds_map_add(button, "type", choose(0, 1, 2, 3, 4, 5))
		ds_map_add(button, "position", 0)
		ds_list_add(buttons, button);
		ds_list_mark_as_map(buttons, ds_list_size(buttons)-1);
		
		var gap = 11/scroll_speed
		next_spawn = scroll_timer + irandom_range(gap, gap+spawn_delay);
	}
	
	// particles
	var xx = x_offset+width-10
	var yy = y_offset+height/2-UNIT+1
	part_particles_create(partstars_sys, xx, yy+irandom_range(-7, 7), partstars, 1)	
	
	// end condition test
	if(cond == 0) {
		ds_map_set(item, "type", ITEM.mush)
		ds_map_set(item, "subtype", SUBTYPE.trash);
		end_condition = true;
		display.explode = true;
		
		scr_alert(item_name + " turned to mush!");
	}
	else if(chop >= 100) {
		var item_name = scr_lib_name(item);
		
		// make player hold peel
		if(scr_lib_property(item, PROPS.peelable)) {
			var type = ds_map_find_value(item, "type")
			var qual = ds_map_find_value(item, "quality")
			obj_player.holding = scr_room_inv_create(type, SUBTYPE.peel, qual, cond)
			
			// get particle color
			if(not is_undefined(item_name)) scr_alert(item_name + " peel was produced!");
		}
		
		if(not is_undefined(item_name)) scr_alert(item_name + " was chopped!");
		ds_map_set(item, "subtype", SUBTYPE.chopped);
		end_condition = true;
		display.explode = true;
	}
	
	event_inherited();	
}
else { // end condition
	if(cancel or interact) {
		scr_menu_clear();
		instance_destroy();
	}
}