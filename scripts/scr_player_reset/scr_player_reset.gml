ds_map_replace(GAMEDATA, "hp", 100);
ds_map_replace(GAMEDATA, "energy", 30);

ds_map_replace(GAMEDATA, "hp_max", 100);
ds_map_replace(GAMEDATA, "energy_max", 30);

// status_effects
var stat = ds_map_find_value(GAMEDATA, "status_effects")
ds_list_clear(stat);
