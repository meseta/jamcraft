var _start_x = argument0;
var _start_y = argument1;
var _width = argument2;
var _amount1 = clamp(floor(argument3), 0, _width); // 
var _amount2 = clamp(floor(argument4), 0, _width);
var _sprite = argument5;

var _left = 4, _first = 2, _second = 1, _empty = 1, _right = 4
var _height = 5;

var _origin_x = _start_x - _left;
var _origin_y = _start_y+1;

// end caps
draw_sprite_part(_sprite, 0, 0, 0, _left, _height, _origin_x, _origin_y)
draw_sprite_part(_sprite, 0, _left+_first+_second+_empty, 0, _right, _height, _origin_x+_left+_width, _origin_y)

// left bar, right bar, top bar, bottom bar
draw_sprite_part_ext(_sprite, 0, _left+_first+_second, 0, _empty, _height, _origin_x+_left, _origin_y, _width/_empty, 1, c_white, 1.0)

if(_amount1 < _amount2) {
	draw_sprite_part_ext(_sprite, 0, _left+_first, 0, _second, _height, _origin_x+_left, _origin_y, _amount2/_second, 1, c_white, 1.0)
	draw_sprite_part_ext(_sprite, 0, _left, 0, _first, _height, _origin_x+_left, _origin_y, _amount1/_first, 1, c_white, 1.0)
}
else {	
	draw_sprite_part_ext(_sprite, 0, _left+_first, 0, _second, _height, _origin_x+_left, _origin_y, _amount1/_second, 1, c_white, 1.0)
	draw_sprite_part_ext(_sprite, 0, _left, 0, _first, _height, _origin_x+_left, _origin_y, _amount2/_first, 1, c_white, 1.0)
}