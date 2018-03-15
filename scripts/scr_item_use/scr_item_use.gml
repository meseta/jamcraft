var item_index = argument0;


var inventory = ds_map_find_value(GAMEDATA, "inventory");
var item = ds_list_find_value(inventory, item_index);

var effects = ds_map_find_value(item, "effects");
if(not is_undefined(effects)) {
	
	
}


scr_alert("No effect!");
