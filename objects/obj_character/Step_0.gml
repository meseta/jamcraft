/// @description Insert description here
// You can write your code in this editor

if(move_is_moving == false) {
	if(move_next_dir != MOVEDIR.undef) {
		move_dir = move_next_dir;
		switch(move_dir) {
			case MOVEDIR.right:
				sprite_index = right_sprite;
				break;
			case MOVEDIR.up:
				sprite_index = up_sprite;
				break;
			case MOVEDIR.left:
				sprite_index = left_sprite;
				break;
			case MOVEDIR.down:
				sprite_index = down_sprite;
				break;
		}
		image_speed = 1
		move_is_moving = true;
	}
	else {
		image_speed = 0;
		image_index = 0;	
	}
}

if(move_is_moving and move_dir != MOVEDIR.undef) {
	switch(move_dir) {
		case MOVEDIR.right:
			x += move_speed;
			break;
		case MOVEDIR.up:
			y -= move_speed;
			break;
		case MOVEDIR.left:
			x -= move_speed;
			break;
		case MOVEDIR.down:
			y += move_speed;
			break;
	}
	
	if(floor(x) % UNIT == 0 and floor(y) % UNIT == 0) {
		x = floor(x);
		y = floor(y);
		move_is_moving = false;
		move_dir = MOVEDIR.undef;
		move_next_dir = MOVEDIR.undef;
		//image_speed = 0;
	}
}