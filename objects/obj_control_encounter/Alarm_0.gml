/// @description 

var player_stat = ds_map_find_value(GAMEDATA, "status_effects");

// check run away chances
var run_chance = 10;
if(enemy_hp < 33) run_chance *= 2;
if(scr_stat_check(player_stat, STATUS.repel)) run_chance *= 4;		
if(scr_stat_check(player_stat, STATUS.fragrant)) run_chance /= 4;

var escape_chance = 50 + enemy_speed-player_speed;
var escape = irandom(100);
var escaped = false

if(irandom(100) < run_chance) {
	// run away	
	scr_debug("Enemy Escape: ", escape, "-", escape_chance);
	if(escape < escape_chance) {
		scr_alert(enemy_name + " ran away!");
		escaped = true;
		
		var return_room = ds_map_find_value(GAMEDATA, "previous_room");
		ds_map_replace(GAMEDATA, "current_room", return_room);
		
		with(obj_warper) {
			fade_color = c_black;
			event_user(0);
		}
		
		turn = TURN.system;
	}
	else {
		scr_alert(enemy_name + " couldn't get away!");;	
	}
}

if(not escaped) {
	var move_list = ds_list_create()
	if(enemy_effects & EFFECTS.healing) ds_list_add(move_list, STATUS.healing);
	if(enemy_effects & EFFECTS.poison) ds_list_add(move_list, STATUS.poison);
	if(enemy_effects & EFFECTS.daze) ds_list_add(move_list, STATUS.daze);
	if(enemy_effects & EFFECTS.acid) ds_list_add(move_list, STATUS.acid);
	if(enemy_effects & EFFECTS.sticky) ds_list_add(move_list, STATUS.sticky);
	if(enemy_effects & EFFECTS.fast) ds_list_add(move_list, STATUS.fast);
	if(enemy_effects & EFFECTS.defence) ds_list_add(move_list, STATUS.defence);

	if(ds_list_size(move_list) == 0 or choose(0, 1)) { // 50% chance of attacking vs effects
		// hit chance
		var hit_chance = 66 + (enemy_speed-player_speed)*2;
		var hit = irandom(100);
		
		scr_debug("Enemy Attack: ", hit, "-", hit_chance);
		
		if(hit < hit_chance) {
			var attack = irandom_range(3, 7);
				
			if(scr_stat_check(player_stat, STATUS.defence)) {
				attack *= enemy_base_attack/(player_base_defence * 3);
			}
			else {
				attack *= enemy_base_attack/player_base_defence;
				if(irandom(100) < 10) {
					scr_alert("Critical Hit!")	
					attack *= 2;
				}
			}
				
			player_hp_damage = attack*4;
			
			scr_debug("Enemy Attack: ", player_hp_damage);
			
			enemy_inst.animate_attack = true;
			player_inst.animate_hit = true;
			alarm_close_inst = scr_alert(enemy_name + " attacks!");
		}
		else {
			player_inst.animate_attack = true;
			alarm_close_inst = scr_alert(enemy_name + " missed!")	
		}
			
	}
	else {
		var random_move = irandom(ds_list_size(move_list));
		var random_status = ds_list_find_value(move_list, random_move);
		
		switch(random_status) {
			case STATUS.healing:
				var heal = irandom_range(20, 50);
				enemy_hp_damage = -heal;
				alarm_close_inst = scr_alert(enemy_name + " healed itself!");
				enemy_inst.animate_attack = true;
				break;
				
			case STATUS.fast:
				enemy_base_speed += irandom_range(1, 5);
				alarm_close_inst = scr_alert(enemy_name + " got faster!");
				enemy_inst.animate_attack = true;
				break;
				
			case STATUS.defence:
				enemy_base_defence += irandom_range(1, 5);
				alarm_close_inst = scr_alert(enemy_name + " got tougher!");
				enemy_inst.animate_attack = true;
				break;
			
			case STATUS.poison:
			case STATUS.daze:
			case STATUS.acid:
			case STATUS.sticky:
				scr_stat_set(player_stat, random_status, 200);
				alarm_close_inst = scr_alert(enemy_name + " shot " + global.status_name[random_status] + "!")
				enemy_inst.animate_attack = true;
				player_inst.animate_hit = true;
				break;
		}

	}
	
		alarm[1] = 120;
	ds_list_destroy(move_list);
	
	scr_debug("Enemy turn end");
	turn = TURN.wait;
}
