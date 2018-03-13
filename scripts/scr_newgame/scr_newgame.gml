GAMEDATA = ds_map_create();
ds_map_add(GAMEDATA, "previous_room", noone);
ds_map_add(GAMEDATA, "current_room", rm_home_town);
ds_map_add_list(GAMEDATA, "inventory", ds_list_create());
ds_map_add_map(GAMEDATA, "room_inventory", ds_map_create());

scr_inv_add_item(scr_inv_new_item(ITEM.pot_tiny, SUBTYPE.equipment, 2, 20, 100));
scr_inv_add_item(scr_inv_new_item(ITEM.jar_tiny, SUBTYPE.equipment, 4, 20, 100));
scr_inv_add_item(scr_inv_new_item(ITEM.strawberry, SUBTYPE.whole, 3, 20, 60));
scr_inv_add_item(scr_inv_new_item(ITEM.strawberry, SUBTYPE.chopped, 3, 20, 60));
scr_inv_add_item(scr_inv_new_item(ITEM.lemon, SUBTYPE.whole, 3, 20, 12));
scr_inv_add_item(scr_inv_new_item(ITEM.sugar, SUBTYPE.ingredient, 100, 20, 100));

room_goto(GAMEDATA[? "current_room"]);