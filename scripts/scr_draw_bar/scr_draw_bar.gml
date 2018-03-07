var _start_x = argument0;
var _start_y = argument1;
var _width = argument2;
var _amount = clamp(floor(argument3), 0, _width);
var _sprite = argument4;

var _left = 4, _full = 2, _empty = 2, _right = 4
var _height = 5;

var _origin_x = _start_x - _left;
var _origin_y = _start_y+1;

var _empty_amount = _width - _amount;

// end caps
draw_sprite_part(_sprite, 0, 0, 0, _left, _height, _origin_x, _origin_y)
draw_sprite_part(_sprite, 0, _left+_full+_empty, 0, _right, _height, _origin_x+_left+_width, _origin_y)

// left bar, right bar, top bar, bottom bar
if(_amount) draw_sprite_part_ext(_sprite, 0, _left, 0, _full, _height, _origin_x+_left, _origin_y, (_amount/_full), 1, c_white, 1.0)
if(_empty_amount) draw_sprite_part_ext(_sprite, 0, _left+_full, 0, _empty, _height, _origin_x+_left+_amount, _origin_y, (_empty_amount/_empty), 1, c_white, 1.0)
