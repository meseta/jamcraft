/// @description Insert description here
// You can write your code in this editor

event_inherited()

if(cancel) exit;

if(not is_undefined(item_idx)) {
	var item = ds_list_find_value(obj_control_room_inventory.inventory, item_idx);
	var cond = ds_map_find_value(item, "condition");
	var qual = ds_map_find_value(item, "quality");
	var chop = ds_map_find_value(item, "chop");
	if(is_undefined(chop)) chop = 0;
	
	var mode = "CHOP";	
	if(scr_item_property(item, PROPS.peelable)) {
		mode = "PEEL";
	}
	
	scr_item_draw(item, x_offset+UNIT/2, y_offset+UNIT/2);
	
	draw_set_color(c_gray);
	draw_text(x_offset+2*UNIT, y_offset-UNIT+3, "QUAL")
	draw_text(x_offset+2*UNIT, y_offset-UNIT+13, "COND")
	draw_text(x_offset+2*UNIT, y_offset-UNIT+23, mode)
	
	scr_draw_bar(x_offset+2*UNIT+38, y_offset-UNIT+13, 40, cond*40/100, spr_cond_bar);
	scr_draw_bar(x_offset+2*UNIT+38, y_offset-UNIT+23, 40, chop*40/100, spr_cond_bar);

	draw_set_color(c_white);
	for(var i=0; i<5; i+=1) {
		if(qual >= (i+1)*20) {
			draw_sprite(spr_star, 0, x_offset+2*UNIT+i*9+36, y_offset-UNIT+9);
		}
		else {
			draw_sprite(spr_star, 1, x_offset+2*UNIT+i*9+36, y_offset-UNIT+9);
		}
	}
	
}