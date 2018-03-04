/// @description Insert description here
// You can write your code in this editor

var inv_end = inventory_offset + inventory_width * inventory_height 
var x_offset = 16;
var y_offset = 32;
for(var i=inventory_offset; i<ds_list_size(inventory) and i<inv_end; i++) {
	var row = (i-inventory_offset) div inventory_width;
	var col = (i-inventory_offset) mod inventory_width;;
	var xx = col * UNIT + x_offset;
	var yy = row * UNIT + y_offset;
	if(i == selected) {
		draw_sprite(spr_inventory_slot, 1, xx, yy);
	}
	else {
		draw_sprite(spr_inventory_slot, 0, xx, yy);
	}
}

if(inventory_offset > 0) {
	draw_sprite(spr_up_arrow, 0, x_offset+inventory_width*UNIT, y_offset-UNIT);
}
if(inv_end < ds_list_size(inventory)) {
	draw_sprite(spr_down_arrow, 0, x_offset+inventory_width*UNIT, y_offset+(inventory_height-1)*UNIT);
}