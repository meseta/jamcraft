/// @description Camera control

var _vw = camera_get_view_width(view_camera[0]) / 2 - UNIT/2;
var _vh = camera_get_view_height(view_camera[0]) / 2 + UNIT/2;
	
camera_set_view_pos(view_camera[0], x - _vw, y - _vh);
