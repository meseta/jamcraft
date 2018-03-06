var menu_items = argument0;
var menu_position = argument1;
var menu_text = argument2;
var menu_script = argument3;
var menu_args = argument4;

var item = ds_map_create();
ds_map_add(item, "text", menu_text);
ds_map_add(item, "script", menu_script);
ds_map_add(item, "args", menu_args);
if(menu_position == -1) {
	ds_list_add(menu_items, item)
	ds_list_mark_as_map(menu_items, ds_list_size(menu_items));
}
else {
	ds_list_insert(menu_items, menu_position, item)
	ds_list_mark_as_map(menu_items, menu_position);
}