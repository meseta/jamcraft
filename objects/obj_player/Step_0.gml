/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if(pause) exit

if(interact and not move_is_moving) {
	var check_x = x;
	var check_y = y;
	switch(move_last_dir) { // set targets
		case MOVEDIR.right:
			check_x += UNIT;
			break;
		case MOVEDIR.up:
			check_y -= UNIT;
			break;
		case MOVEDIR.left:
			check_x -= UNIT;
			break;
		case MOVEDIR.down:
			check_y += UNIT;
			break;
	}
	
	var int_inst = instance_place(check_x, check_y, obj_interactable);
	with(int_inst) {
		
		if(object_is_ancestor(object_index, obj_storage) and not is_undefined(other.holding)) { // putting objects back into inventory
			var item = ds_list_find_value(obj_control_room_inventory.inventory, other.holding);
			var item_subtype = ds_map_find_value(item, "subtype");
			if(scr_inv_in_filter(item_subtype, filter_list)) { // check if right storage type
				scr_app_putback(other.holding);
			}
		}
		else {
			event_user(0);
		}
	}
	interact = false;
}