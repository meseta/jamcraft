/// @description Insert description here
// You can write your code in this editor

instance_destroy(inventory_details);
if(not is_undefined(inventory_map)) {
	ds_list_destroy(inventory_map);	
}