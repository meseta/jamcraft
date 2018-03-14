var slot = argument0;

if(file_exists("save.json")) {
	//var savemap = ds_map_secure_load(global.savename);
	var file = file_text_open_read("save.json");
	var j = file_text_read_string(file);
	
	if(not is_undefined(GAMEDATA)) ds_map_destroy(GAMEDATA);
	
	GAMEDATA = json_decode(j);
	file_text_close(file);

	scr_menu_clear();
	
	instance_create_layer(0, 0, "Instances", obj_player);
	instance_create_layer(0, 0, "UI", obj_control_room_inventory);
	instance_create_layer(0, 0, "UI", obj_warper);
	room_goto(ds_map_find_value(GAMEDATA, "current_room"));

}
else {
	scr_alert("No save file!");	
}
