/// @description Insert description here
// You can write your code in this editor

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
		event_user(0);	
	}
	interact = 0;
}