/// @description Insert description here
// You can write your code in this editor

event_inherited();

// create inventory instance (create it offscreen)
menu_inst = instance_create_layer(x-300, y-300, "UI", obj_inventory);
menu_inst.option_take = true;

scr_debug("Open inventory inst ", menu_inst)

// push inventory menu into interact stack
ds_stack_push(global.interact_stack, menu_inst);