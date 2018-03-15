if(not is_undefined(GAMEDATA)) ds_map_destroy(GAMEDATA);

GAMEDATA = ds_map_create();
ds_map_add(GAMEDATA, "previous_room", noone);
ds_map_add(GAMEDATA, "current_room", rm_home_kitchen);
ds_map_add_list(GAMEDATA, "inventory", ds_list_create());
ds_map_add_map(GAMEDATA, "room_inventory", ds_map_create());

scr_inv_add_item(scr_inv_new_item(ITEM.pot_tiny, SUBTYPE.equipment, 2, 20, 100));
scr_inv_add_item(scr_inv_new_item(ITEM.jar_tiny, SUBTYPE.equipment, 4, 20, 100));
scr_inv_add_item(scr_inv_new_item(ITEM.strawberry, SUBTYPE.whole, 3, 20, 60));
scr_inv_add_item(scr_inv_new_item(ITEM.lemon, SUBTYPE.whole, 3, 20, 30));
scr_inv_add_item(scr_inv_new_item(ITEM.lime, SUBTYPE.whole, 3, 20, 30));
scr_inv_add_item(scr_inv_new_item(ITEM.orange, SUBTYPE.whole, 3, 20, 30));
scr_inv_add_item(scr_inv_new_item(ITEM.bergamot, SUBTYPE.whole, 3, 20, 30));
scr_inv_add_item(scr_inv_new_item(ITEM.sugar, SUBTYPE.ingredient, 100, 20, 100));

ds_map_add(GAMEDATA, "status_effects", ds_list_create());
scr_player_reset();

scr_menu_clear();

instance_create_layer(0, 0, "Instances", obj_player);
instance_create_layer(0, 0, "UI", obj_control_room_inventory);
instance_create_layer(0, 0, "UI", obj_warper);
room_goto(GAMEDATA[? "current_room"]);