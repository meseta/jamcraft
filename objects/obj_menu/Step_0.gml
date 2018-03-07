/// @description Insert description here

if(cancel) {
	if(ds_stack_top(global.interact_stack) == id) {
		ds_stack_pop(global.interact_stack);
	}
	instance_destroy();
	exit
}