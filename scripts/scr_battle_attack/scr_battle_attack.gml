var attack = argument0;

var battle_alert = undefined;

// check if sufficient EP:
ep = ds_map_find_value(GAMEDATA, "energy");
if(ep < attack) {
	scr_alert("Insufficient Energy!");
}
else {
	scr_menu_clear();
	scr_debug("Attack: ", attack);
	with(obj_control_encounter) {
		
		// hit chance
		var hit_chance = 66 + (player_speed-enemy_speed)*2;
		var hit = irandom(100);
		
		scr_debug("Attack: ", hit, "-", hit_chance);
		
		if(hit < hit_chance) {
			
			attack *= player_base_attack/enemy_base_defence;
			
			if(irandom(100) < 10) {
				alarm_close_inst = scr_alert("You scored a critical hit!")	
				attack *= 2
			}
			
			enemy_hp_damage = attack*2;
			
			scr_debug("Attack: ", enemy_hp_damage);
			
			enemy_cond_damage = attack*attack/3;
			player_ep_damage = attack;
			
			player_inst.animate_attack = true;
			enemy_inst.animate_hit = true;
		}
		else {
			player_inst.animate_attack = true;
			alarm_close_inst = scr_alert("You missed!")	
		}
		turn = TURN.wait;
		alarm[1] = 120;
	}
}