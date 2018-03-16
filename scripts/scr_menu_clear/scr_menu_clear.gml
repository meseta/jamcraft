// cancel everything in the interact stack
var stacksize = ds_stack_size(global.interact_stack)

repeat(stacksize) {
	var inst = ds_stack_pop(global.interact_stack);
	if(instance_exists(inst)) {
		scr_debug("Clear interact stack item ", inst);
		inst.cancel = true;
	}
}