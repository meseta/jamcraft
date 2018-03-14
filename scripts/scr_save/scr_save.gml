//ds_map_secure_save(GAMEDATA, global.savename);
var j = json_encode(GAMEDATA);
var file=file_text_open_write("save.json");
file_text_write_string(file,j);
file_text_close(file);

scr_menu_clear();

scr_alert("Game Saved!");