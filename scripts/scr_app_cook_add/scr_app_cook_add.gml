var item_to_add_idx = argument0;
var container_idx = parent.holding;

var item_to_add = ds_list_find_value(obj_control_room_inventory.inventory, item_to_add_idx);
var container = ds_list_find_value(obj_control_room_inventory.inventory, container_idx);
var contents = ds_map_find_value(container, "contents");

if(is_undefined(contents)) {	
	ds_map_add_list(container, "contents", ds_list_create());
	contents = ds_map_find_value(container, "contents");
}

if(ds_list_size(contents) < scr_get_capacity(container)) {
	// copy across
	var new_content = ds_map_create();
	ds_map_copy(new_content, item_to_add);
	ds_list_add(contents, new_content);
	ds_list_mark_as_map(contents, ds_list_size(contents)-1);

	// remove from player
	ds_map_destroy(item_to_add);
	ds_list_set(obj_control_room_inventory.inventory, item_to_add_idx, undefined);
	obj_player.holding = undefined;
	
	// recalculate content color
	var new_color = scr_inv_calculate_color(contents);
	ds_map_set(container, "content_color", new_color);
	
	cancel = true;
}
else {
	var item_name = scr_lib_lookup(container, "name")
	if(not is_undefined(item_name)) {
		scr_alert(item_name + " is full!");
	}
	else {
		scr_alert("Container is full!")	
	}
}
