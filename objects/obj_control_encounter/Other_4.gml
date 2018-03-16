/// @description 

if(room == rm_battle) { // at the start of battle, deactivate player
	instance_deactivate_object(obj_player)
	
	// show player stats
	player_stat_inst = instance_create_depth(x-300, y-300, depth, obj_icon_playerstats);
	player_inst = instance_create_layer(8, 100, "Instances", obj_backsprite);
	
	player_hp_damage = 0;
	player_ep_damage = 0;
	
	player_base_attack = 15;
	player_base_defence = 15;
	
	// enemy
	enemy_inst = instance_create_layer(90, 90, "Instances", obj_enemy);
	enemy_stat_inst = instance_create_depth(x-300, y-300, depth, obj_icon_enemystats);
	
	var library = ds_map_find_value(global.item_library, enemy_fruit)
	if(not is_undefined(library)) {
		enemy_name = ds_map_find_value(library, "name");
	}	
	enemy_stat_inst.enemy_name = enemy_name;
	enemy_stat_inst.stars = enemy_stars;
	
	
	// set up enemy stats
	enemy_base_speed = enemy_stars * 5
	enemy_base_defence = enemy_stars * 5
	enemy_base_attack = enemy_stars * 5
	enemy_hp = 100;
	enemy_hp_damage = 0;
	enemy_cond_damage = 0;
	enemy_effects = EFFECTS.none;
	
	enemy_stat_inst.hp_frac = enemy_hp/100;
	enemy_stat_inst.cond_frac = enemy_cond/100;
	
	// get base_defense and attacks
	var total_cook_rate = 0;
	var library = ds_map_find_value(global.item_library, enemy_fruit)
	var library_subtypes = ds_map_find_value(library, "subtypes")
	// get chopped subtype
	var subtype = ds_map_find_value(library_subtypes, SUBTYPE.chopped);
	var cook_rate = ds_map_find_value(subtype, "cook_rate");
	total_cook_rate += cook_rate
	var effects = ds_map_find_value(subtype, "effects");
	enemy_effects |= effects;
	// get peel subtype
	var subtype = ds_map_find_value(library_subtypes, SUBTYPE.peel);
	if(not is_undefined(subtype)) {
		var cook_rate = ds_map_find_value(subtype, "cook_rate");
		total_cook_rate += cook_rate
		var effects = ds_map_find_value(subtype, "effects");
		enemy_effects |= effects;
	}
	enemy_base_defence *= total_cook_rate;
	
	enemy_turn_timer = 0;
	player_turn_timer = 0;
	turn = TURN.wait;

}
else if(room == rm_gameover) {
	instance_deactivate_object(obj_player)
	scr_alert("You were killed by a fruit");	
	alarm[2] = 300;
	
}
else {
	// on return to start room, reset previous room to current room
	ds_map_replace(GAMEDATA, "previous_room", room);
	obj_control_music.next_bgm = snd_bgm_overworld;
	
	// grant loot
	var inventory = ds_map_find_value(GAMEDATA, "inventory");
	
	if(enemy_hp <= 0 or enemy_cond <= 0) {
		repeat(6) {
			var added = undefined;
			
			if(enemy_cond > 0) {
				var rand = irandom_range(0,6)
			}
			else {
				var rand = irandom_range(0,15);
			}
			switch(rand) {
				case 0:
					added = scr_inv_add_item(scr_inv_new_item(choose(ITEM.pot_tiny, ITEM.pot_small, ITEM.pot_medium, ITEM.pot_large), SUBTYPE.equipment, 1, enemy_stars*20, 100));
					break;
				case 1:
					added = scr_inv_add_item(scr_inv_new_item(choose(ITEM.jar_tiny, ITEM.jar_small, ITEM.jar_medium, ITEM.jar_large), SUBTYPE.equipment, 1, enemy_stars*20, 100));
					break;
				case 2:
					added = scr_inv_add_item(scr_inv_new_item(ITEM.sugar, SUBTYPE.ingredient, 5, enemy_stars*20, 100));
					break;
				case 3:
				case 4:
				case 5:
				case 6:
					break;
				default:
					var choose_fruit = choose(ITEM.strawberry, ITEM.lemon, ITEM.lime, ITEM.orange, ITEM.mandarin, ITEM.bergamot)
					added = scr_inv_add_item(scr_inv_new_item(choose_fruit, SUBTYPE.whole, 1, enemy_stars*20, enemy_cond));
			}
			if(not is_undefined(added)) {
			
				var item = ds_list_find_value(inventory, added);
				var item_type = ds_map_find_value(item, "type");
				var library = ds_map_find_value(global.item_library, item_type)
	
				if(not is_undefined(library)) {
					var library_name = ds_map_find_value(library, "name");
				}
				scr_alert("You got " + library_name)
			}
		}
	}
	
	instance_destroy();
}