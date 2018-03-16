/// @description Insert description here

if(cancel) {
	if(ds_stack_top(global.interact_stack) == id) {
		do {
			ds_stack_pop(global.interact_stack);	
			var next_inst = ds_stack_top(global.interact_stack);
		} until(is_undefined(next_inst) or instance_exists(next_inst));
		// scan through to find next valid one
	}
	instance_destroy();
	exit
}