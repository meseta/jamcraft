var check = argument1;
var stat_list = argument0;

var stat = ds_list_find_value(stat_list, check);

if(not is_undefined(stat) and stat > 0) return stat

return 0 