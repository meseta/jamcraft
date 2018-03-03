/// @description Insert description here
// You can write your code in this editor

if(move_is_moving == false) {
	if(move_dir != MOVEDIR.undef) { // has a direction to move
		var candidate_target_x = move_target_x;
		var candidate_target_y = move_target_y;
		switch(move_dir) { // set targets
			case MOVEDIR.right:
				sprite_index = right_sprite;
				candidate_target_x = (floor(x/UNIT)+1) * UNIT;
				break;
			case MOVEDIR.up:
				sprite_index = up_sprite;
				candidate_target_y = (floor(y/UNIT)-1) * UNIT;
				break;
			case MOVEDIR.left:
				sprite_index = left_sprite;
				candidate_target_x = (floor(x/UNIT)-1) * UNIT;
				break;
			case MOVEDIR.down:
				sprite_index = down_sprite;
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
	else { // no direction to move, stop animation
		image_speed = 0;
		image_index = 0;
	}
}

if(move_is_moving) { // currently moving
	if(x != move_target_x or y != move_target_y) { // not at target yet,
		var xdiff = move_target_x - x;
		var ydiff = move_target_y - y;
		
		scr_debug(x, " ", move_target_x);
	
		x += sign(xdiff) * min(move_speed, abs(xdiff)); // don't overshoot
		y += sign(ydiff) * min(move_speed, abs(ydiff));
	}
	
	if(x == move_target_x and y == move_target_y) { // now at target, stop moving
		move_target_x = floor(x/UNIT) * UNIT; // snap to grid in case it isn't already
		move_target_y = floor(y/UNIT) * UNIT;
		move_is_moving = false;
		move_dir = MOVEDIR.undef;
	}
}