/// @description 

if(link_room != noone) {
	if(obj_warper.fade == false) {
		ds_map_set(GAMEDATA, "previous_room", room);
		ds_map_set(GAMEDATA, "current_room", link_room);
		with(obj_warper) {
			event_user(0);		
		}
	}
}
