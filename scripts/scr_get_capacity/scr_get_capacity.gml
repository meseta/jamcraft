var item = argument0;

var cap_A = scr_lib_property(item, PROPS.capacity_A)
var cap_B = scr_lib_property(item, PROPS.capacity_B)
var cap = cap_B << 1 | cap_A;

switch(cap) {
	default:
	case 0:
		return 3;
	case 1:
		return 7;
	case 2:
		return 14;
	case 3:
		return 21;
}