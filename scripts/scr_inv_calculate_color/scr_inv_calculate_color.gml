var contents = argument0;

var cyan =0;
var magenta = 0;
var yellow = 0;
var count = 0;

for(var i=0; i< ds_list_size(contents); i++) {
	var item = ds_list_find_value(contents, i);
	if(scr_lib_property(item, PROPS.colorant)) {
		var color = scr_lib_color(item);
		var red = color_get_red(color)
		var green = color_get_green(color)
		var blue = color_get_blue(color)
		
		cyan += 255-red;
		magenta += 255-green;
		yellow += 255-blue;
		count += 1;
	}
}

var red = 255-(cyan/count);
var green = 255-(magenta/count);
var blue = 255-(yellow/count);

return make_color_rgb(red, green, blue)