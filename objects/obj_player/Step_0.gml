/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if(pause) exit

if(cancel) {
	scr_main_menu();
	cancel = false;
}

if(move_arrived) {
	move_arrived = false;
	
	// stat effects
	var player_stat = ds_map_find_value(GAMEDATA, "status_effects");
	scr_stat_step(player_stat, 1);
	
	move_speed = 1;
	if(scr_stat_check(player_stat, STATUS.daze)) move_speed *= 0.75;	
	if(scr_stat_check(player_stat, STATUS.sticky)) move_speed *= 0.5;	
	if(scr_stat_check(player_stat, STATUS.fast)) move_speed *= 2;

	hp = ds_map_find_value(GAMEDATA, "hp");
	if(scr_stat_check(player_stat, STATUS.poison) or scr_stat_check(player_stat, STATUS.acid)) {
		hp = max(1, hp-1);
	}
	ds_map_replace(GAMEDATA, "hp", hp);
	
	// encounters
	if(encounter_blankout > 0) {
		encounter_blankout -= 1;
	}
	else {
		// check collision
		var tree_inst = instance_place(x, y, obj_tree);
		if(tree_inst != noone) {		
			encounter_blankout = 2;
			with(tree_inst) {
				event_user(0);	
			}
		}
	}
}

if(interact and not move_is_moving) {
	var check_x = x;
	var check_y = y;
	switch(move_last_dir) { // set targets
		case MOVEDIR.right:
			check_x += UNIT;
			break;
		case MOVEDIR.up:
			check_y -= UNIT;
			break;
		case MOVEDIR.left:
			check_x -= UNIT;
			break;
		case MOVEDIR.down:
			check_y += UNIT;
			break;
	}
	
	var int_inst = instance_place(check_x, check_y, obj_interactable);
	with(int_inst) {
		
		if(object_is_ancestor(object_index, obj_storage) and not is_undefined(other.holding)) { // putting objects back into inventory
			var item = ds_list_find_value(obj_control_room_inventory.inventory, other.holding);
			var item_subtype = ds_map_find_value(item, "subtype");
			if(scr_inv_in_filter(item_subtype, filter_list)) { // check if right storage type
				scr_app_putback(other.holding);
			}
		}
		else {
			event_user(0);
		}
	}
	interact = false;
}