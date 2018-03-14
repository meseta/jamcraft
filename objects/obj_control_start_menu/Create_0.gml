/// @description 

select_inst = noone;

if(not instance_exists(obj_control_camera)) instance_create_layer(0, 0, "UI", obj_control_camera);
if(not instance_exists(obj_control_input)) instance_create_layer(0, 0, "UI", obj_control_input);
if(not instance_exists(obj_control_music)) instance_create_layer(0, 0, "UI", obj_control_music);