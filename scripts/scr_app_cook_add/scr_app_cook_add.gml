var item_to_add_idx = argument0;
var container_idx = parent.holding;

var item_to_add = ds_list_find_value(obj_control_room_inventory.inventory, item_to_add_idx);
var container = ds_list_find_value(obj_control_room_inventory.inventory, container_idx);
var contents = ds_map_find_value(container, "contents");

if(is_undefined(contents)) {	
	ds_map_add(container, "contents", ds_list_create());
	contents = ds_map_find_value(container, "contents");
}

// copy across
var new_content = ds_map_create();
ds_map_copy(new_content, item_to_add);	
ds_list_add(contents, new_content);
ds_list_mark_as_map(contents, ds_list_size(contents)-1);

// remove from player
ds_map_destroy(item_to_add);
ds_list_delete(obj_control_room_inventory.inventory, item_to_add_idx);
obj_player.holding = undefined;

cancel = true;