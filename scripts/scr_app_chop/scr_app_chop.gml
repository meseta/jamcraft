var item_select = argument0;

// add chop to item
var item = ds_list_find_value(obj_control_room_inventory.inventory, item_select);
if(is_undefined(ds_map_find_value(item, "chop"))) {
	ds_map_add(item, "chop", 0);	
}

// create chopping app
var app = scr_menu_create(obj_app_chop);
app.item_idx = item_select;
app.display = additional_display;
app.x_offset = 2 * UNIT;
app.y_offset = 6.5 * UNIT;
app.width = 6 * UNIT;
app.height = 28;