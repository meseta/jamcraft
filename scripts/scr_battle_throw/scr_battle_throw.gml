var item_index = argument0;

var inventory = ds_map_find_value(GAMEDATA, "inventory");
var item = ds_list_find_value(inventory, item_index);

var effects = ds_map_find_value(item, "effects");
var filter = EFFECTS.poison | EFFECTS.daze | EFFECTS.acid | EFFECTS.sticky 

var battle_alert = undefined;

if(not is_undefined(effects) and effects & filter > 0) {	
	scr_menu_clear();
	
	var multiplier = 1
	if(effects & EFFECTS.multiplier) multiplier = 2;
	
	with(obj_control_encounter) {
		if(effects & EFFECTS.poison) {
			battle_alert = scr_alert("Threw " + global.status_name[STATUS.poison] + " at " + enemy_name);
			scr_stat_set(enemy_stat, EFFECTS.poison, 200);
		}
		if(effects & EFFECTS.daze) {
			battle_alert = scr_alert("Threw " + global.status_name[STATUS.daze] + " at " + enemy_name);
			scr_stat_set(enemy_stat, EFFECTS.daze, 200);
		}
		if(effects & EFFECTS.acid) {
			battle_alert = scr_alert("Threw " + global.status_name[STATUS.acid] + " at " + enemy_name);
			scr_stat_set(enemy_stat, EFFECTS.acid, 200);
		}
		if(effects & EFFECTS.sticky) {
			battle_alert = scr_alert("Threw " + global.status_name[STATUS.sticky] + " at " + enemy_name);
			scr_stat_set(enemy_stat, EFFECTS.sticky, 200);
		}
	}
	// TODO: throw jar animation
	
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
	battle_alert = scr_alert("Can't throw!");
}

if(not is_undefined(battle_alert)) {
	with(obj_control_encounter) {
		alarm_close_inst = battle_alert;
		alarm[1] = 120;
	}
}