/// @description Insert description here
// You can write your code in this editor

if(move_is_moving == false and move_next_dir != MOVEDIR.undef) {
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

if(move_is_moving and move_dir != MOVEDIR.undef) {
	switch(move_dir) {
		case MOVEDIR.right:
			x += 1;
			break;
		case MOVEDIR.up:
			y -= 1;
			break;
		case MOVEDIR.left:
			x -= 1;
			break;
		case MOVEDIR.down:
			y += 1;
			break;
	}
	
	if(floor(x) % UNIT == 0 and floor(y) % UNIT == 0) {
		x = floor(x);
		y = floor(y);
		move_is_moving = false;
		move_dir = MOVEDIR.undef;
		image_index = 0;
		image_speed = 0;
	}
}