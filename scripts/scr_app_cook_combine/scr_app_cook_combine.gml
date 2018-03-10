var container_add_idx = argument0;
var container_idx = parent.holding;

// get container to add to
var container = ds_list_find_value(obj_control_room_inventory.inventory, container_idx);
var contents = ds_map_find_value(container, "contents");
if(is_undefined(contents)) {	
	ds_map_add(container, "contents", ds_list_create());
	contents = ds_map_find_value(container, "contents");
}
var size = ds_list_size(contents);


// get stuff to add
var container_add = ds_list_find_value(obj_control_room_inventory.inventory, container_add_idx);
var contents_add = ds_map_find_value(container_add, "contents");
if(is_undefined(contents_add)) {	
	ds_map_add(container_add, "contents", ds_list_create());
	contents_add = ds_map_find_value(container_add, "contents");
}
var size_add = ds_list_size(contents_add)

// check if there's enough space
if(size + size_add <= scr_pot_get_capacity(container)) {
	for(var i=0; i<size_add; i++) { // move contents across
		var content_add = ds_list_find_value(contents_add, i);
		
		ds_list_add(contents, content_add);
		ds_list_mark_as_map(contents, ds_list_size(contents)-1);
	}
	
	// recalculate colors
	var new_color = scr_inv_calculate_color(contents);
	ds_map_set(container, "content_color", new_color);
	
	repeat(size_add) { // zero out old container
		ds_list_delete(contents_add, 0);	
	}
	
	// clear color of old container
	ds_map_set(container_add, "content_color", undefined);
}
else {
	var item_name = scr_lib_name(container);
	if(not is_undefined(item_name)) {
		scr_alert(item_name + " is full!");
	}
	else {
		scr_alert("Container is full!")	
	}
}
