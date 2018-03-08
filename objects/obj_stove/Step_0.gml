/// @description 

if(not is_undefined(holding)) {
	var item = ds_list_find_value(obj_control_room_inventory.inventory, holding)
	if(scr_item_property(item, PROPS.cookware)) {
		scr_debug("heat level", heat_level);
		
	}
}