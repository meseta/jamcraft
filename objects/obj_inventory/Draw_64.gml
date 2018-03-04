/// @description Insert description here
// You can write your code in this editor

var inventory = ds_map_find_value(GAMEDATA, "inventory");
var x_offset = 16;
var y_offset = 48
for(var i=0; i<ds_list_size(inventory); i++) {
	var row = i div 6;
	var col = i mod 6;
	var xx = row * UNIT + x_offset;
	var yy = col * UNIT + y_offset;
	draw_sprite(spr_inventory_slot, 0, xx, yy);	
}