
with(obj_control_encounter) {
	
	var escape_chance = 50 + player_speed-enemy_speed;
	var escape = irandom(100);
	scr_debug("Escape: ", escape, "-", escape_chance);
	if(escape < escape_chance) {
		scr_menu_clear();
		scr_alert("Ran Away!")
		
		var return_room = ds_map_find_value(GAMEDATA, "previous_room");
		ds_map_replace(GAMEDATA, "current_room", return_room);
		
		with(obj_warper) {
			fade_color = c_black;
			event_user(0);
		}
		
		turn = TURN.system;
	}
	else {
		scr_menu_clear();
		scr_alert("Escape was blocked!");	
		turn = TURN.wait;
	}
}
