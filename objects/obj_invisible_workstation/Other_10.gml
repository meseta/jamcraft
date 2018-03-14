/// @description 

scr_debug("Interact with ", object_get_name(object_index))

if(not is_undefined(obj_player.holding) and is_undefined(holding)) {
	// player has item, counter empty: place item on counter
	holding = obj_player.holding
	obj_player.holding = undefined;	
}
else if(is_undefined(obj_player.holding) and not is_undefined(holding)) {
	// counter has item, player empty: take item from counter
	obj_player.holding = holding;
	holding = undefined
}
else if(not is_undefined(obj_player.holding) and not is_undefined(holding)) {
	// interactions!
	// TODO: interaction types
	var tmp_holding = holding;
	holding = obj_player.holding
	obj_player.holding = tmp_holding;
}
