/// @description Insert description here
// You can write your code in this editor

ds_list_destroy(menu_items);
if(instance_exists(additional_display)) {
	instance_destroy(additional_display);	
}