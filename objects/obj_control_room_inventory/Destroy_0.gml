/// @description Insert description here
// You can write your code in this editor

with(obj_player) {
	if(not is_undefined(holding)) {
		scr_app_putback(holding)	
	}
}

with(obj_workstation) {
	if(not is_undefined(holding)) {
		var item = ds_list_find_value(other.inventory, holding)
		ds_map_replace(item, "workstation_holding", id);
	}
}

// clean up undefines
for(var i=ds_list_size(inventory)-1; i>=0; i--) {
	var item = ds_list_find_value(inventory, i);
	if(not is_undefined(item)) {
		var workstation = ds_map_find_value(item, "workstation_holding");
		if(is_undefined(workstation)) item = undefined;
	}
	if(is_undefined(item)) {
		ds_list_delete(inventory, i);
		
		// move everything above it down
		for(var j=i; j<ds_list_size(inventory); j++) {
			var other_item = ds_list_find_value(inventory, j);
			var workstation = ds_map_find_value(other_item, "workstation_holding");
			workstation.holding = j
		}
	}
}
