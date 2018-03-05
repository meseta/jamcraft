/// @description Insert description here
// You can write your code in this editor

event_inherited()

// inventory contents
for(var i=inventory_offset; i<ds_list_size(inventory) and i<inv_end; i++) {
	// select item
	var item = ds_list_find_value(inventory, i);
	var item_type = ds_map_find_value(item, "type");
	var library = ds_map_find_value(global.item_library, item_type)
	if(not is_undefined(library)) {
		var sprite = ds_map_find_value(library, "sprite");
		var text_name = ds_map_find_value(library, "name");
	}
	else {
		var sprite = spr_item_undef;
		var text_name = "Item #" + string(item_type);
	}
	
	// calculate position
	var row = (i-inventory_offset) div inventory_width;
	var col = (i-inventory_offset) mod inventory_width;;
	var xx = col * UNIT + x_offset;
	var yy = row * UNIT + y_offset;
	if(i == selected) {
		draw_sprite(spr_inventory_slot, 1, xx, yy);
		
		// move inventory details
		inventory_details.x_offset = xx + UNIT + 4;
		inventory_details.y_offset = yy;
		inventory_details.text_name = text_name;
		inventory_details.text_qtty = ds_map_find_value(item, "quantity");
		inventory_details.text_cond = ds_map_find_value(item, "condition");
		inventory_details.text_qual = ds_map_find_value(item, "quality");
	}
	else {
		draw_sprite(spr_inventory_slot, 0, xx, yy);
	}
	
	// draw sprite
	draw_sprite(sprite, 0, xx, yy);
	
}

if(inventory_offset > 0) {
	draw_sprite(spr_up_arrow, 0, x_offset+inventory_width*UNIT-4, y_offset-UNIT);
}
if(inv_end < ds_list_size(inventory)) {
	draw_sprite(spr_down_arrow, 0, x_offset+inventory_width*UNIT-4, y_offset+(inventory_height-1)*UNIT+1);
}
