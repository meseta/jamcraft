var menu_obj = argument0;

var new_depth = depth-100-ds_stack_size(global.interact_stack);
var inst = instance_create_depth(x-200, y-200, new_depth, menu_obj);
ds_stack_push(global.interact_stack, inst);

return inst;