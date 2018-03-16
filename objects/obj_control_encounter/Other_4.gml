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
else {
	// on return to start room, reset previous room to current room
	ds_map_replace(GAMEDATA, "previous_room", room);
	obj_control_music.next_bgm = snd_bgm_overworld;
	instance_destroy();
}