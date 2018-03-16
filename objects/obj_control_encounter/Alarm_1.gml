/// @description 

if(instance_exists(alarm_close_inst)) {
	//if(ds_stack_top(global.interact_stack) == alarm_close_inst.id) {
	alarm_close_inst.cancel = true;
	alarm_close_inst = noone;
	//}
}