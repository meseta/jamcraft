GAMEDATA = ds_map_create();
ds_map_add(GAMEDATA, "current_room", rm_home_kitchen);
ds_map_add(GAMEDATA, "inventory", ds_list_create());

scr_inv_add_item(scr_inv_new_item(ITEM.pot, SUBTYPE.equipment, 1, 20, 100, false));
scr_inv_add_item(scr_inv_new_item(ITEM.jar, SUBTYPE.equipment, 4, 20, 100, false));
scr_inv_add_item(scr_inv_new_item(ITEM.strawberry, SUBTYPE.whole, 3, 20, 100, true));
scr_inv_add_item(scr_inv_new_item(ITEM.raspberry, SUBTYPE.whole, 3, 20, 100, true));
scr_inv_add_item(scr_inv_new_item(ITEM.sugar, SUBTYPE.ingredient, 100, 20, 100, false));
scr_inv_add_item(scr_inv_new_item(ITEM.lemon, SUBTYPE.juice, 5, 20, 100, true));

repeat(20) scr_inv_add_item(scr_inv_new_item(ITEM.lemon, SUBTYPE.juice, 5, 20, 100, true));

instance_create_layer(0, 0, "UI", obj_control_camera);
instance_create_layer(0, 0, "UI", obj_control_input);

room_goto(GAMEDATA[? "current_room"]);