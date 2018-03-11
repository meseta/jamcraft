var item = argument0
var subtype_value = argument1
var sprite = argument2;
var subimage = argument3;
var properties = argument4;

var subtypes = ds_map_find_value(item, "subtypes");
if(is_undefined(subtypes)) {
	subtypes = ds_map_create();
}

var subtype = ds_map_create();
ds_map_add(subtype, "sprite", sprite);
ds_map_add(subtype, "subimage", subimage);
ds_map_add(subtype, "properties", properties);

ds_map_add_map(subtypes, subtype_value, subtype)
return subtype;
