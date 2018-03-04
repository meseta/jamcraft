/// @description Insert description here
// You can write your code in this editor

var key_right = max(keyboard_check(vk_right), keyboard_check(ord("D")), 0);
var key_left = max(keyboard_check(vk_left), keyboard_check(ord("A")), 0);
var key_down = max(keyboard_check(vk_down), keyboard_check(ord("S")), 0);
var key_up = max(keyboard_check(vk_up), keyboard_check(ord("W")), 0);
	
var key_primary = max(keyboard_check_pressed(vk_space), mouse_check_button_pressed(mb_left));
var key_secondary = max(keyboard_check_pressed(vk_shift), mouse_check_button_pressed(mb_right));

// Gamepad Input
if(gamepad_is_connected(0)) {
	gamepad_set_axis_deadzone(0, 0.1);
	key_right = max(key_right, gamepad_button_check(0, gp_padr), 0);
	key_left = max(key_left, gamepad_button_check(0, gp_padl), 0);
	key_down = max(key_down, gamepad_button_check(0, gp_padd), 0);
	key_up = max(key_up, gamepad_button_check(0, gp_padu), 0);
	
	key_primary = max(key_primary, gamepad_button_check_pressed(0, gp_face1), gamepad_button_check_pressed(0, gp_shoulderr), 0);
	key_secondary = max(key_secondary, gamepad_button_check_pressed(0, gp_face2), gamepad_button_check_pressed(0, gp_shoulderl), 0);
	
	var axis_x = gamepad_axis_value(0, gp_axislh);
	var axis_y = gamepad_axis_value(0, gp_axislv);
	if(axis_x > 0) key_right = true;
	else if(axis_x < 0) key_left = true;
	if(axis_y > 0) key_down = true;
	else if(axis_y < 0) key_up = true;
	
}

if(menu_target == noone) { // player move
	with(obj_player) {
		if(key_right) move_dir = MOVEDIR.right
		if(key_up) move_dir = MOVEDIR.up
		if(key_left) move_dir = MOVEDIR.left
		if(key_down) move_dir = MOVEDIR.down
		interact = key_primary;
	}
}
else {
	with(menu_target) {
		select_right = key_right
		select_up = key_up
		select_left = key_left
		select_down = key_down
	}
}
