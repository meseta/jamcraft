var text = argument0;

var inst = instance_create_depth(x-200, y-200, depth-2000, obj_alert);
inst.text = text;
ds_stack_push(global.interact_stack, inst);