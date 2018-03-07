var item_select = argument0;

// acquire display
var display = noone
with(obj_icon_chop) {
	if(item_idx == item_select) {
		display = id;
		break;
	}
}

// add chop to item
var item = ds_list_find_value(obj_control_room_inventory.inventory, item_select);
if(is_undefined(ds_map_find_value(item, "chop"))) {
	ds_map_add(item, "chop", 0);	
}

// create chopping app
var app = instance_create_depth(x-200, y-200, depth-1, obj_app_chop);
app.item = item_select;
app.display = display;
app.x_offset = 2 * UNIT;
app.y_offset = 6.5 * UNIT;
app.width = 6 * UNIT;
app.height = 2 * UNIT;

ds_stack_push(global.interact_stack, app);