/// @description Insert description here
// You can write your code in this editor

event_inherited();

scr_debug("Open inventory")
// create inventory instance
menu_inst = instance_create_layer(x, y, "UI", obj_inventory);
// push inventory menu into interact stack
ds_stack_push(global.interact_stack, menu_inst);

