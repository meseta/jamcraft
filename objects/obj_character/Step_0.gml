/// @description Insert description here
// You can write your code in this editor

if(move_is_moving == false) {
	if(move_dir != MOVEDIR.undef) { // has a direction to move
		var candidate_target_x = move_target_x;
		var candidate_target_y = move_target_y;
		move_last_dir = move_dir;
		
		switch(move_dir) { // set targets
			case MOVEDIR.right:
				candidate_target_x = (floor(x/UNIT)+1) * UNIT;
				break;
			case MOVEDIR.up:
				candidate_target_y = (floor(y/UNIT)-1) * UNIT;
				break;
			case MOVEDIR.left:
				candidate_target_x = (floor(x/UNIT)-1) * UNIT;
				break;
			case MOVEDIR.down:
				candidate_target_y = (floor(y/UNIT)+1) * UNIT;
				break;
		}
		
		if(not place_meeting(candidate_target_x, candidate_target_y, obj_solid)) {
			move_target_x = candidate_target_x
			move_target_y = candidate_target_y
			image_speed = 1
			move_is_moving = true;	
		}
		else {
			move_dir = MOVEDIR.undef;
		}
		
	}
	else { // no direction to move, stop animatio	n
		image_speed = 0;
		image_index = 0;
	}
}

if(move_is_moving) { // currently moving
	if(x != move_target_x or y != move_target_y) { // not at target yet,
		var xdiff = move_target_x - x;
		var ydiff = move_target_y - y;
		
		x += sign(xdiff) * min(move_speed, abs(xdiff)); // don't overshoot
		y += sign(ydiff) * min(move_speed, abs(ydiff));
		
		depth = -y;
	}
	
	if(x == move_target_x and y == move_target_y) { // now at target, stop moving
		move_target_x = floor(x/UNIT) * UNIT; // snap to grid in case it isn't already
		move_target_y = floor(y/UNIT) * UNIT;
		move_is_moving = false;
		move_dir = MOVEDIR.undef;
	}
}


switch(move_last_dir) { // set targets
	case MOVEDIR.right:
		if(not is_undefined(holding)) sprite_index = right_holding
		else sprite_index = right_sprite;
		break;
	case MOVEDIR.up:
		if(not is_undefined(holding)) sprite_index = up_holding
		else sprite_index = up_sprite;
		break;
	case MOVEDIR.left:
		if(not is_undefined(holding)) sprite_index = left_holding
		else sprite_index = left_sprite;
		break;
	case MOVEDIR.down:
		if(not is_undefined(holding)) sprite_index = down_holding
		else sprite_index = down_sprite;
		break;
}