/// @description 

ds_map_replace(GAMEDATA, "previous_room", room);
ds_map_replace(GAMEDATA, "current_room", rm_sleep);
with(obj_warper) {
	fade_color = c_navy;
	fade_rate_multiplier = 0.3;
	event_user(0);
}

countdown = 180;