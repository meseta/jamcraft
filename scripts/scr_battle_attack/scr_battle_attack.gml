var attack = argument0;

// check if sufficient EP:
ep = ds_map_find_value(GAMEDATA, "energy");
if(ep < attack) {
	scr_alert("Insufficient Energy!");
}
else {
	scr_menu_clear();
	scr_debug("Attack: ", attack);
	with(obj_control_encounter) {
		//var damage = attack*
	}
}