var item_index = argument0;

var inventory = ds_map_find_value(GAMEDATA, "inventory");
var item = ds_list_find_value(inventory, item_index);

var effects = ds_map_find_value(item, "effects");
var filter = EFFECTS.healing | EFFECTS.fast | EFFECTS.repel | EFFECTS.fragrant | EFFECTS.defence | EFFECTS.energy;

var battle_alert = undefined;

if(not is_undefined(effects) and effects & filter > 0) {	
	scr_menu_clear();
	var player_stat = ds_map_find_value(GAMEDATA, "status_effects");
	
	var multiplier = 1
	if(effects & EFFECTS.multiplier) multiplier = 2;
	
	if(effects & EFFECTS.healing) {
		var healing = 20*multiplier;
		var hp = ds_map_find_value(GAMEDATA, "hp");
		var newhp = clamp(hp+healing, 0, 100);
		var healed_amount = newhp-hp;
			
		if(instance_exists(obj_control_encounter)) {
			with(obj_control_encounter) {
				player_hp_damage = -healing
				turn = TURN.wait;
			}
		}
		else {
			ds_map_replace(GAMEDATA, "hp", newhp);
		}
		
		battle_alert = scr_alert("Healed " + string(healed_amount) + " HP");
	}
	
	if(effects & EFFECTS.energy) {
		var energize = 20*multiplier;
		var energy = ds_map_find_value(GAMEDATA, "energy");
		var newenergy = clamp(energy+energize, 0, 100);
		var energized_amount = newenergy-energy;
			
		if(instance_exists(obj_control_encounter)) {
			with(obj_control_encounter) {
				player_energy_damage = -energize
				turn = TURN.wait
			}
		}
		else {
			ds_map_replace(GAMEDATA, "energy", newenergy);
		}
		
		battle_alert = scr_alert("Energized " + string(energized_amount) + " EP");
	}
	
	if(effects & EFFECTS.fast) {
		if(scr_stat_check(player_stat, STATUS.fast)) {
			battle_alert = scr_alert(global.status_name[STATUS.fast] + " extended")
		}
		else {
			battle_alert = scr_alert("Gained " + global.status_name[STATUS.fast] + "!");
		}
		scr_stat_set(player_stat, STATUS.fast, 200);
	}
	
	if(effects & EFFECTS.fast) {
		if(scr_stat_check(player_stat, STATUS.fast)) {
			battle_alert = scr_alert(global.status_name[STATUS.fast] + " extended")
		}
		else {
			battle_alert = scr_alert("Gained " + global.status_name[STATUS.fast] + "!");
		}
		scr_stat_set(player_stat, STATUS.fast, 200);
	}
	
	if(effects & EFFECTS.repel) {
		if(scr_stat_check(player_stat, STATUS.repel)) {
			battle_alert = scr_alert(global.status_name[STATUS.repel] + " extended")
		}
		else {
			battle_alert = scr_alert("Gained " + global.status_name[STATUS.repel] + "!");
		}
		scr_stat_set(player_stat, STATUS.repel, 200);
	}
	
	if(effects & EFFECTS.fragrant) {
		if(scr_stat_check(player_stat, STATUS.fragrant)) {
			battle_alert = scr_alert(global.status_name[STATUS.fragrant] + " extended")
		}
		else {
			battle_alert = scr_alert("Gained " + global.status_name[STATUS.fragrant] + "!");
		}
		scr_stat_set(player_stat, STATUS.fragrant, 200);
	}	
	
	if(effects & EFFECTS.defence) {
		if(scr_stat_check(player_stat, STATUS.defence)) {
			battle_alert = scr_alert(global.status_name[STATUS.defence] + " extended")
		}
		else {
			battle_alert = scr_alert("Gained " + global.status_name[STATUS.defence] + "!");
		}
		scr_stat_set(player_stat, STATUS.defence, 200);
	}	
	
	
	// remove from inventory
	var qty = ds_map_find_value(item, "quantity");
	if(qty > 1) {
		// subtract 1 from inventory
		ds_map_replace(item, "quantity", qty-1);
	}
	else {
		// remove from inventory
		ds_list_delete(inventory, item_index)
	}

}
else {
	battle_alert = scr_alert("No effect!");
}

if(not is_undefined(battle_alert)) {
	with(obj_control_encounter) {
		alarm_close_inst = battle_alert;
		alarm[1] = 120;
	}
}