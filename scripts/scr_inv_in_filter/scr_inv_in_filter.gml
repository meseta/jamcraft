var item_subtype = argument0
var filter_list = argument1

if(is_undefined(filter_list)) return true;

for(var j=0; j<array_length_1d(filter_list); j++) {
	scr_debug("Filter ", item_subtype, " and ", filter_list[j]);
	if(item_subtype == filter_list[j]) {
		scr_debug("yes")
		return true
	}
}

return false
