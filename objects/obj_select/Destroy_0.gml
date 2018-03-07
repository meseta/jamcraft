/// @description Insert description here
// You can write your code in this editor

ds_list_destroy(menu_items);
if(instance_exists(additional_display)) {
	additional_display.cancel = true;
}