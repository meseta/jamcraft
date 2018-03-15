var step_size = argument1;
var stat_list = argument0;
   
for(var i=0; i<ds_list_size(stat_list); i++) {
	var steps = ds_list_find_value(stat_list, i);
	if(not is_undefined(steps) and steps > 0) {
		steps = max(0, steps-step_size);
		
		if(steps == 0) {
			var stat_name = global.status_name[i];
			scr_alert(stat_name + " wore off!");
		}
		ds_list_replace(stat_list, i, steps);
	}
}