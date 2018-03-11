var pot_idx = argument0;
var jar_idx = parent.holding;

// make sure jar is empty
var jar = ds_list_find_value(obj_control_room_inventory.inventory, jar_idx);
var contents = ds_map_find_value(jar, "contents");
if(is_undefined(contents)) {	
	ds_map_add_list(jar, "contents", ds_list_create());
	contents = ds_map_find_value(jar, "contents");
}
var size = ds_list_size(contents);

if(size > 0) {
	var item_name = scr_lib_lookup(jar_idx, "name");
	if(not is_undefined(item_name)) {
		scr_alert(item_name + " is not empty!");
	}
	else {
		scr_alert("Jar is not empty!")	
	}
	return false;
}

// scan and set stats:
if(scr_app_cook_combine(pot_idx)) {
	var sweetness = 0;
	var sourness = 0;
	var bitterness = 0;
	var pectin = 0;
	var effects = 0;
	
	var doneness = 0;
	var quality = 0;
	
	var fruit_name = "Fruit";
	var type_name = "Jam";
	var type_test_sugar = 0;
	var type_test_fruit = 0;
	var type_test_peel = 0;
	
	var contents = ds_map_find_value(jar, "contents");
	for(var i=0; i<ds_list_size(contents); i++) { // move contents across
		var item = ds_list_find_value(contents, i);
		
		quality += ds_map_find_value(item, "quality");
		doneness += ds_map_find_value(item, "doneness");
			
		sweetness += scr_lib_lookup_subtype(item, "sweetness");
		sourness += scr_lib_lookup_subtype(item, "sourness");
		bitterness += scr_lib_lookup_subtype(item, "bitterness");
		pectin += scr_lib_lookup_subtype(item, "pectin");
		
		effects |= scr_lib_lookup_subtype(item, "effects");
		
		var item_type = ds_map_find_value(item, "type");
		if(item_type == ITEM.sugar) type_test_sugar += 1;
		
		var item_subtype = ds_map_find_value(item, "subtype");
		if(item_subtype == SUBTYPE.chopped) type_test_fruit += 1;
		if(item_subtype == SUBTYPE.peel) type_test_peel += 1;
		
		scr_debug("quality: ", ds_map_find_value(item, "quality"))
		// TODO: fruit name
		
	}
	if(type_test_fruit > 0) {
		doneness /= type_test_fruit;
	}
	quality /= ds_list_size(contents);
	var jar_quality = ds_map_find_value(jar, "quality");
	
	ds_map_replace(jar, "content_quality", (quality+jar_quality)/2);
	ds_map_replace(jar, "doneness", doneness);
	ds_map_replace(jar, "sweetness", sweetness);
	ds_map_replace(jar, "sourness", sourness);
	ds_map_replace(jar, "bitterness", bitterness);
	ds_map_replace(jar, "pectin", pectin);
	ds_map_replace(jar, "effects", effects);
	
	// work out type name
	if(type_test_fruit == 0) {
		type_name = "Syrup"
	}
	else if(doneness < 25) {
		type_name = "Salad"	
	}
	else if(type_test_sugar == 0) {
		type_name = "Spread"	
	}
	else if(type_test_peel > type_test_fruit) {
		type_name = "Marmalade"	
	}
	else if(type_test_sugar > type_test_fruit) {
		type_name = "Conserve"	
	}
	
	ds_map_replace(jar, "type_name", type_name);
	ds_map_replace(jar, "fruit_name", fruit_name);
	
	// todo: chutney
	
	scr_debug("Type: ", type_name);
	
}
