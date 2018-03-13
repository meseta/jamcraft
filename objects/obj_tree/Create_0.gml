/// @description 

color = undefined;
if(not is_undefined(fruit)) {
	var library = ds_map_find_value(global.item_library, fruit)
	if(not is_undefined(library)) {
		color = ds_map_find_value(library, "color"); // undefined is allowed
	}
}