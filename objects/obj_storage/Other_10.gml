/// @description Insert description here
// You can write your code in this editor

event_inherited();

scr_debug("Open inventory")
// create inventory instance (create it offscreen)
menu_inst = instance_create_layer(x-200, y-200, "UI", obj_inventory);
// push inventory menu into interact stack
ds_stack_push(global.interact_stack, menu_inst);