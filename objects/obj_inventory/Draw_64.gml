/// @description Insert description here
// You can write your code in this editor

event_inherited()

var inv_end = inventory_offset + inventory_width * inventory_height;

// inventory contents
for(var i=inventory_offset; i<inventory_size and i<inv_end; i++) {
	draw_set_color(c_white)
	
	// select item
	if(is_undefined(inventory_map)) {
		var inv_index = i
	}
	else {
		var inv_index = ds_list_find_value(inventory_map, i);
	}
	var item = ds_list_find_value(inventory, inv_index);
	var item_type = ds_map_find_value(item, "type");
	var library = ds_map_find_value(global.item_library, item_type)
	if(not is_undefined(library)) {
		var sprite = ds_map_find_value(library, "sprite");
		var library_name = ds_map_find_value(library, "name");
		var sprite_subimage = ds_map_find_value(library, "subimage");
	}
	else {
		var sprite = spr_item_undef;
		var library_name = "UNDEF#" + string(item_type);
		var sprite_subimage = 0;
	}
	var quantity = ds_map_find_value(item, "quantity");
	
	// calculate position
	var row = (i-inventory_offset) div inventory_width;
	var col = (i-inventory_offset) mod inventory_width;;
	var xx = col * UNIT + x_offset;
	var yy = row * UNIT + y_offset;
	if(i == selected) {
		draw_sprite(spr_inventory_slot, 1, xx, yy);
		
		// move inventory details
		inventory_details.x_offset = inventory_width * UNIT + x_offset + 5;
		inventory_details.y_offset = yy;
		inventory_details.text_name = library_name;
		inventory_details.text_qtty = quantity;
		inventory_details.text_cond = ds_map_find_value(item, "condition");
		inventory_details.text_qual = ds_map_find_value(item, "quality");
		
		selected_x = xx;
		selected_y = yy;
	}
	else {
		draw_sprite(spr_inventory_slot, 0, xx, yy);
	}
	
	// draw sprite
	draw_sprite(sprite, sprite_subimage, xx, yy);
	
	// draw quantity
	if(quantity > 1) {
		draw_set_color(c_gray);
		draw_set_font(global.small_digits);
		draw_set_halign(fa_left);
		draw_set_valign(fa_top);
		draw_text(xx+2, yy-1, string(quantity))
	}
}

if(inventory_offset > 0) {
	draw_sprite(spr_up_arrow, 0, x_offset+inventory_width*UNIT-4, y_offset-UNIT);
}
if(inv_end < inventory_size) {
	draw_sprite(spr_down_arrow, 0, x_offset+inventory_width*UNIT-4, y_offset+(inventory_height-1)*UNIT+1);
}
