/// @description 

if(instance_exists(display)) {

	var library = ds_map_find_value(global.item_library, fruit)
	if(not is_undefined(library)) {
		enemy_name = ds_map_find_value(library, "name");
	}	
	display.enemy_name = enemy_name;
	display.stars = stars;
	
	display.hp_frac = hp/100;
	display.cond_frac = cond/100;
	
}