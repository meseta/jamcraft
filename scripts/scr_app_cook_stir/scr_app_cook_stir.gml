var item_select = argument0

// add stri to item
var item = ds_list_find_value(obj_control_room_inventory.inventory, item_select);

var stir_level = ds_map_find_value(item, "stir")
if(is_undefined(stir_level)) {
	stir_level = 0;
	ds_map_add(item, "stir", 0);
}

// create chopping app
var app = scr_menu_create(obj_app_cook);
app.item_idx = item_select;
app.display = additional_display;
app.x_offset = 2 * UNIT;
app.y_offset = 7 * UNIT+2;
app.width = 6 * UNIT;
app.height = 37;