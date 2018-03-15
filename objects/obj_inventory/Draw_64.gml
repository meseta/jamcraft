/// @description Insert description here
// You can write your code in this editor

event_inherited()
if(cancel) exit;


var inv_end = inventory_offset + inventory_width * inventory_height;
if(is_undefined(inventory_map)) {
	var inventory_size = ds_list_size(inventory);
}
else {
	var inventory_size = ds_list_size(inventory_map);
}

// inventory contents
for(var i=inventory_offset; i<inventory_size and i<inv_end; i++) {
	draw_set_color(c_white)
	
	// calculate position
	var row = (i-inventory_offset) div inventory_width;
	var col = (i-inventory_offset) mod inventory_width;;
	var xx = col * UNIT + x_offset;
	var yy = row * UNIT + y_offset;
	
	// draw inventory slot
	if(i == selected) {
		draw_sprite(spr_inventory_slot, 1, xx, yy);
	}
	else {
		draw_sprite(spr_inventory_slot, 0, xx, yy);
	}
	
	// select item
	if(is_undefined(inventory_map)) {
		var inv_index = i
	}
	else {
		var inv_index = ds_list_find_value(inventory_map, i);
	}
	var item = ds_list_find_value(inventory, inv_index);
	var quantity = ds_map_find_value(item, "quantity");
	var subtype = ds_map_find_value(item, "subtype");
	var library_name = scr_item_draw(item, xx, yy);
	
	// move inventory details
	if(i == selected) {
		inventory_details.x_offset = inventory_width * UNIT + x_offset + 5;
		inventory_details.y_offset = yy;
		inventory_details.text_name = library_name;
		inventory_details.text_subtype = global.subtype_name[subtype];
		inventory_details.text_qtty = quantity;
		inventory_details.text_cond = ds_map_find_value(item, "condition");
		inventory_details.text_qual = ds_map_find_value(item, "quality");
		inventory_details.can_use = can_use
		inventory_details.can_throw = can_throw
		inventory_details.text_efct = ds_map_find_value(item, "effects");
		
		selected_x = xx;
		selected_y = yy;
	}
	
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
