GAMEDATA = ds_map_create();
ds_map_add(GAMEDATA, "current_room", rm_home_kitchen);
ds_map_add(GAMEDATA, "inventory", ds_list_create());

scr_inv_add_item(scr_inv_new_item(ITEM.pot, SUBTYPE.equipment, 1, 20, 100));
scr_inv_add_item(scr_inv_new_item(ITEM.jar, SUBTYPE.equipment, 4, 20, 100));
scr_inv_add_item(scr_inv_new_item(ITEM.strawberry, SUBTYPE.whole, 3, 20, 60));
scr_inv_add_item(scr_inv_new_item(ITEM.lemon, SUBTYPE.whole, 3, 20, 12));
scr_inv_add_item(scr_inv_new_item(ITEM.sugar, SUBTYPE.ingredient, 100, 20, 100));
scr_inv_add_item(scr_inv_new_item(ITEM.lemon, SUBTYPE.juice, 5, 20, 80));

instance_create_layer(0, 0, "UI", obj_control_camera);
instance_create_layer(0, 0, "UI", obj_control_input);
instance_create_layer(0, 0, "UI", obj_control_room_inventory);

room_goto(GAMEDATA[? "current_room"]);