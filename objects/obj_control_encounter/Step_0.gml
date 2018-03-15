/// @description 

if(room == rm_battle) {
	if(turn == TURN.wait) {
		if(instance_exists(select_inst)) scr_menu_clear();
		
		// wait for menu
		if(scr_menu_stack_size() == 0) {
		
			if(player_turn_timer >= 100) { // player turn
				player_turn_timer -= 100;
				turn = TURN.player;
				scr_debug("Player turn start")
			}
			else if(enemy_turn_timer >= 100) { // enemy turn
				enemy_turn_timer -= 100;
				turn = TURN.enemy;
				scr_debug("Enemy turn start")
				alarm[0] = 60;
			}
			else {
				var player_stat = ds_map_find_value(GAMEDATA, "status_effects");
				scr_stat_step(player_stat, 5);
			
				player_speed = 10
				if(scr_stat_check(player_stat, STATUS.daze)) player_speed = 0;
				if(scr_stat_check(player_stat, STATUS.sticky)) player_speed *= 0.5;
				if(scr_stat_check(player_stat, STATUS.fast)) player_speed *= 2;
		
				player_turn_timer += player_speed
			
				scr_stat_step(enemy_stat, 5);
			
				enemy_speed = enemy_base_speed;
				if(scr_stat_check(enemy_speed, STATUS.daze)) enemy_speed = 0;
				if(scr_stat_check(enemy_speed, STATUS.sticky)) enemy_speed *= 0.5;
				if(scr_stat_check(enemy_speed, STATUS.fast)) enemy_speed *= 2;
				enemy_turn_timer += enemy_speed;
		
				scr_debug("Player timer: ", player_turn_timer, " Enemy timer: ", enemy_turn_timer)
			}
		}
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