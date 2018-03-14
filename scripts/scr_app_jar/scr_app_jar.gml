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
	var item_name = scr_lib_lookup(jar, "name");
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
	
	var total_doneness = 0;
	var total_quality = 0;
	
	var fruit_name = "Fruit";
	var type_name = "Jam";
	var type_test_sugar = 0;
	var type_test_fruit = 0;
	var type_test_peel = 0;
	
	var contents = ds_map_find_value(jar, "contents");
	for(var i=0; i<ds_list_size(contents); i++) { // move contents across
		var item = ds_list_find_value(contents, i);
		
		total_quality += ds_map_find_value(item, "quality");
		var doneness = ds_map_find_value(item, "doneness")
			
		sweetness += scr_lib_lookup_subtype(item, "sweetness") * doneness/100;
		sourness += scr_lib_lookup_subtype(item, "sourness") * doneness/100;
		bitterness += scr_lib_lookup_subtype(item, "bitterness") * doneness/100;
		pectin += scr_lib_lookup_subtype(item, "pectin") * doneness/100;
		
		if(doneness > 90) {
			effects |= scr_lib_lookup_subtype(item, "effects");
		}
		
		var item_type = ds_map_find_value(item, "type");
		if(item_type == ITEM.sugar) type_test_sugar += 1;
		
		var item_subtype = ds_map_find_value(item, "subtype");
		if(item_subtype == SUBTYPE.chopped) {
			type_test_fruit += 1;
			total_doneness += doneness;
			// TODO: fruit name
		}
		if(item_subtype == SUBTYPE.peel) {
			type_test_peel += 1;
			total_doneness += doneness
		}
		
		scr_debug("quality: ", ds_map_find_value(item, "quality"))
		// TODO: fruit name
		
	}
	if(type_test_fruit > 1) {
		fruit_name = "Fruit"	
	}
	
	if(type_test_fruit+type_test_peel > 0) {
		total_doneness /= (type_test_fruit+type_test_peel);
	}
	
	if(type_test_fruit > 0) {
		sweetness /= type_test_fruit;
		sourness /= type_test_fruit;
		bitterness /= type_test_fruit;
		pectin /= type_test_fruit;
	}
	
	var set = 0;
	if(sweetness < pectin or sourness < pectin) {
		set = SET.runny;	
	}
	else if(pectin > 50) {
		set = SET.firm;
	}
	else {
		set = SET.good;
	}
	
	total_quality /= ds_list_size(contents);
	var jar_quality = ds_map_find_value(jar, "quality");
	
	ds_map_replace(jar, "content_quality", (total_quality+jar_quality)/2);
	ds_map_replace(jar, "doneness", total_doneness);
	ds_map_replace(jar, "sweetness", sweetness);
	ds_map_replace(jar, "sourness", sourness);
	ds_map_replace(jar, "bitterness", bitterness);
	ds_map_replace(jar, "pectin", pectin);
	ds_map_replace(jar, "set", set)	;
	ds_map_replace(jar, "effects", effects);
	
	// work out type name
	if(type_test_fruit == 0 and type_test_sugar > 0) {
		type_name = "Syrup"
	}
	else if(doneness < 25) {
		type_name = "Salad"	
	}
	else if(type_test_sugar == 0 and type_test_fruit > 0) {
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
