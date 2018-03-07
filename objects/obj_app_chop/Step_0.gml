/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if(cancel) exit;

if(start_animation < 4*start_animation_speed) start_animation += 1;
else {
	scroll_timer += 1;
	randval = irandom(1000);
	goodness = 0;
	var best_goodness = undefined;
	var best_idx = undefined;
	var best_type = undefined;
	
	// move items and calculate best goodness
	for(var i=ds_list_size(buttons)-1; i>=0; i-=1) { // must run backward to avoid messing with unscanned indexes on delete
		var button = ds_list_find_value(buttons, i);
		var position = ds_map_find_value(button, "position") + scroll_speed;
		
		if(position > 76) {
			ds_map_destroy(button);
			ds_list_delete(buttons, i);
		}
		else {
			// check goodness
			var goodness_score = abs(position - goodness_position)
			if(is_undefined(best_goodness) or goodness_score < best_goodness) {
				best_goodness = goodness_score;
				best_idx = i;
				best_type = ds_map_find_value(button, "type");
			}
			
			if(round(position) == 67) goodness = 2;
			ds_map_set(button, "position", position);
		}
	}
	
	// handle goodness and input
	if(is_undefined(best_goodness)) goodness = 0;
	else goodness = 2-clamp(floor(best_goodness/2), 0, 2);
	
	if(select_up or select_right or select_down or select_left or interact) {
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
			if(best_type == 4) hit = true;
			else miss = true;
		}
			
		if(miss or goodness == 0) {
			scr_debug("hurt")	
		}
		else if(hit and goodness > 0) {
			var button = ds_list_find_value(buttons, best_idx);
			ds_map_destroy(button);
			ds_list_delete(buttons, best_idx);
			scr_debug("hit", goodness);	
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
		ds_map_add(button, "type", choose(0, 1, 2, 3, 4))
		ds_map_add(button, "position", 0)
		ds_list_add(buttons, button);
		ds_list_mark_as_map(buttons, ds_list_size(buttons)-1);
		
		var gap = 11/scroll_speed
		next_spawn = scroll_timer + irandom_range(gap, gap+spawn_delay);
	}
	
}