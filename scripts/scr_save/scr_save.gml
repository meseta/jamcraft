//ds_map_secure_save(GAMEDATA, global.savename);

scr_menu_clear();

// deal with player and room inventory

// use room_inventory's saving. However this puts player's held item back, so we'll capture it and restore later
var player_holding = undefined
with(obj_player) {
	if(not is_undefined(holding)) {
		player_holding = scr_app_putback(holding)	
	}
}

with(obj_control_room_inventory) {
	event_perform(ev_destroy, 0)
}

var j = json_encode(GAMEDATA);
var file=file_text_open_write("save.json");
file_text_write_string(file,j);
file_text_close(file);

if(not is_undefined(player_holding)) {
	scr_app_takeout(player_holding);
}

scr_alert("Game Saved!");