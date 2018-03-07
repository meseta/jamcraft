var _start_x = argument0;
var _start_y = argument1;
var _width = argument2;
var _height = argument3;
var _sprite = argument4;

// box
var _col1 = 8, _col2 = 8, _col3 = 8;
var _row1 = 8, _row2 = 8, _row3 = 8;

// center box
var _padding_x = 0;
var _padding_y = 0;
var _center_width = _width + _padding_x;
var _center_height = _height + _padding_y;
var _origin_x = _start_x-_padding_x-_col1;
var _origin_y = _start_y-_padding_y-_row1-UNIT+1;

draw_sprite_part_ext(_sprite, 0, _col1, _row1, _col2, _row2, _origin_x+_col1, _origin_y+_row1, (_center_width/_col2), (_center_height/_row2), c_white, 1.0)

// left bar, right bar, top bar, bottom bar
draw_sprite_part_ext(_sprite, 0, 0, _row1, _col1, _row2, _origin_x, _origin_y+_row1, 1, (_center_height/_row2), c_white, 1.0)
draw_sprite_part_ext(_sprite, 0, _col1+_col2, _row1, _col3, _row2, _origin_x+_col1+_center_width, _origin_y+_row1, 1, (_center_height/_row2), c_white, 1.0)
draw_sprite_part_ext(_sprite, 0, _col1, 0, _col2, _row1, _origin_x+_col1, _origin_y, (_center_width/_col2), 1, c_white, 1.0)
draw_sprite_part_ext(_sprite, 0, _col1, _row1+_row2, _col2, _row3, _origin_x+_col1, _origin_y+_row1+_center_height, (_center_width/_col2), 1, c_white, 1.0)

// top left, top right, bottom right, bottom left
draw_sprite_part(_sprite, 0, 0, 0, _col1, _row1, _origin_x, _origin_y);
draw_sprite_part(_sprite, 0, _col1+_col2, 0, _col3, _row1, _origin_x+_col1+_center_width, _origin_y);
draw_sprite_part(_sprite, 0, _col1+_col2, _row1+_row2, _col3, _row3, _origin_x+_col1+_center_width, _origin_y+_row1+_center_height);
draw_sprite_part(_sprite, 0, 0, _row1+_row2, _col1, _row3, _origin_x, _origin_y+_row1+_center_height);
