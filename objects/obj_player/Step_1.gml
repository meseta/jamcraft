/// @description user input

var key_right = max(keyboard_check(vk_right), keyboard_check(ord("D")), 0);
var key_left = max(keyboard_check(vk_left), keyboard_check(ord("A")), 0);
var key_down = max(keyboard_check(vk_down), keyboard_check(ord("S")), 0);
var key_up = max(keyboard_check(vk_up), keyboard_check(ord("W")), 0);
	
var key_primary = max(keyboard_check(vk_space), mouse_check_button(mb_left));
var key_secondary = max(keyboard_check(vk_shift), mouse_check_button(mb_right));

var axis_x = (key_right - key_left);
var axis_y = (key_down - key_up);

// Gamepad Input
if(gamepad_is_connected(0)) {
	gamepad_set_axis_deadzone(0, 0.1);
	key_right = max(key_right, gamepad_button_check(0, gp_padr), 0);
	key_left = max(key_left, gamepad_button_check(0, gp_padl), 0);
	key_down = max(key_down, gamepad_button_check(0, gp_padd), 0);
	key_up = max(key_up, gamepad_button_check(0, gp_padu), 0);
	
	key_primary = max(key_primary, gamepad_button_check(0, gp_face1), gamepad_button_check(0, gp_shoulderr), 0);
	key_secondary = max(key_secondary, gamepad_button_check(0, gp_face2), gamepad_button_check(0, gp_shoulderl), 0);
	
	axis_x += gamepad_axis_value(0, gp_axislh);
	axis_y += gamepad_axis_value(0, gp_axislv);
}

if(abs(axis_x) > 0 or abs(axis_y) > 0) {
	if(abs(axis_x) > abs(axis_y)) {
		if(axis_x > 0) move_dir = MOVEDIR.right
		else move_dir = MOVEDIR.left
	}
	else {
		if(axis_y > 0) move_dir = MOVEDIR.down
		else move_dir = MOVEDIR.up
	}
}

if(key_right) move_dir = MOVEDIR.right
if(key_up) move_dir = MOVEDIR.up
if(key_left) move_dir = MOVEDIR.left
if(key_down) move_dir = MOVEDIR.down