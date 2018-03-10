var container_add_idx = argument0;
var container_idx = parent.holding;

var container_add = ds_list_find_value(obj_control_room_inventory.inventory, container_add_idx);
var container = ds_list_find_value(obj_control_room_inventory.inventory, container_idx);

var contents_add = ds_map_find_value(container_add, "contents");
if(is_undefined(contents_add)) {	
	ds_map_add(container_add, "contents", ds_list_create());
	contents_add = ds_map_find_value(container_add, "contents");
}

var contents = ds_map_find_value(container, "contents");
if(is_undefined(contents)) {	
	ds_map_add(container, "contents", ds_list_create());
	contents = ds_map_find_value(container, "contents");
}

var size_add = ds_list_size(contents_add)
var size = ds_list_size(contents);

if(size + size_add <= scr_pot_get_capacity(container)) {
	for(var i=0; i<size_add; i++) {
		var content_add = ds_list_find_value(contents_add, i);
		
		ds_list_add(contents, content_add);
		ds_list_mark_as_map(contents, ds_list_size(contents)-1);
	}
	repeat(size_add) {
		ds_list_delete(contents_add, 0);	
	}
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