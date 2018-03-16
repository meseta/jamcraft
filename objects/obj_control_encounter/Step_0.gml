/// @description 

if(room == rm_battle) {
	if(turn == TURN.wait) {
		var player_stat = ds_map_find_value(GAMEDATA, "status_effects");

		// wait for menu
		if(scr_menu_stack_size() == 0) {
			
			player_hp_damage = player_hp_damage div 1;
			player_ep_damage = player_ep_damage div 1;
			enemy_hp_damage = enemy_hp_damage div 1;
			enemy_cond_damage = enemy_cond_damage div 1;
			
			// deal with damage bars
			if(player_hp_damage != 0 or player_ep_damage != 0) { // if statements split this way to do simultaneous updates
				var hp = ds_map_find_value(GAMEDATA, "hp");
				var ep = ds_map_find_value(GAMEDATA, "energy");
				
				if(player_hp_damage != 0) {
					hp -= sign(player_hp_damage);
					player_hp_damage -= sign(player_hp_damage);
					hp = clamp(hp, 0, 100)
				}
				if(player_ep_damage != 0) {
					ep -= sign(player_ep_damage);
					player_ep_damage -= sign(player_ep_damage);
					ep = clamp(ep, 0, 100);
					
				}
				ds_map_replace(GAMEDATA, "hp", hp);
				ds_map_replace(GAMEDATA, "energy", ep);
				
			}
			else if(enemy_hp_damage != 0 or enemy_cond_damage !=0) {
				if(enemy_hp_damage != 0) {
					enemy_hp -= sign(enemy_hp_damage);
					enemy_hp_damage -= sign(enemy_hp_damage);
					enemy_hp = clamp(enemy_hp, 0, 100);
				}
				if(enemy_cond_damage != 0) {
					enemy_cond -= sign(enemy_cond_damage);
					enemy_cond_damage -= sign(enemy_cond_damage);
					enemy_cond = clamp(enemy_cond, 0, 100);
				}
				
				enemy_stat_inst.hp_frac = enemy_hp/100;
				enemy_stat_inst.cond_frac = enemy_cond/100;
			}
			else if(player_turn_timer >= 100) { // player turn
				if(scr_stat_check(player_stat, STATUS.poison)) {
					var hp = ds_map_find_value(GAMEDATA, "hp");
					hp = clamp(hp-10, 0, 100)
					ds_map_replace(GAMEDATA, "hp", hp);
					alarm_close_inst = scr_alert("You took poison damage");
					alarm[1] = 120;
				}
				if(scr_stat_check(player_stat, STATUS.acid)) {
					var hp = ds_map_find_value(GAMEDATA, "hp");
					hp = clamp(hp-5, 0, 100)
					ds_map_replace(GAMEDATA, "hp", hp);
					alarm_close_inst = scr_alert("You took acid damage");
					alarm[1] = 120;
				}
				player_turn_timer -= 100;
				turn = TURN.player;
				scr_debug("Player turn start")
			}
			else if(enemy_turn_timer >= 100) { // enemy turn
				if(scr_stat_check(enemy_stat, STATUS.poison)) {
					enemy_hp = clamp(enemy_hp-10, 0, 100)
					alarm_close_inst = scr_alert(enemy_name + " took poison damage");
					alarm[1] = 120;
				}
				if(scr_stat_check(enemy_stat, STATUS.acid)) {
					enemy_hp = clamp(enemy_hp-10, 0, 100)
					alarm_close_inst = scr_alert(enemy_name + " took acid damage");
					alarm[1] = 120;
				}
				enemy_turn_timer -= 100;
				turn = TURN.enemy;
				scr_debug("Enemy turn start")
				alarm[0] = 30;
			}
			else {
				scr_stat_step(player_stat, 2);
			
				player_speed = 10
				if(scr_stat_check(player_stat, STATUS.daze)) player_speed = 0;
				if(scr_stat_check(player_stat, STATUS.sticky)) player_speed *= 0.5;
				if(scr_stat_check(player_stat, STATUS.fast)) player_speed *= 2;
		
				player_turn_timer += player_speed
			
				scr_stat_step(enemy_stat, 2);
			
				enemy_speed = enemy_base_speed;
				if(scr_stat_check(enemy_speed, STATUS.daze)) enemy_speed = 0;
				if(scr_stat_check(enemy_speed, STATUS.sticky)) enemy_speed *= 0.5;
				if(scr_stat_check(enemy_speed, STATUS.fast)) enemy_speed *= 2;
				enemy_turn_timer += enemy_speed;
		
				scr_debug("Player timer: ", player_turn_timer, " Enemy timer: ", enemy_turn_timer)
			}
		}
	}
	
	
	if(enemy_hp <= 0 or enemy_cond <= 0) {
		// TODO: win state
	}
	var hp = ds_map_find_value(GAMEDATA, "hp");
	if(hp <= 0) {
		// loose state	
	}
	

	if(turn == TURN.player and not instance_exists(select_inst)) {
		select_inst = scr_menu_create(obj_select);
		select_inst.x_offset = 0.5 * UNIT - 2;
		select_inst.y_offset = 7 * UNIT;
		select_inst.width = 4 * UNIT;
		
		scr_menu_add(select_inst.menu_items, 0, "Run", scr_battle_run, noone)
		scr_menu_add(select_inst.menu_items, 0, "Use", scr_inventory_use, noone)
		scr_menu_add(select_inst.menu_items, 0, "Throw", scr_inventory_throw, noone)
		scr_menu_add(select_inst.menu_items, 0, "Attack", scr_battle_attack_menu, noone)
	}
}