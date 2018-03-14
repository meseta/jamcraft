/// @function scr_lib_subtype_cooking(subtype, cook_rate, sweetness, sourness, bitterness, spiciness, pectin, effects)
/// @description Create a new item ds_map
/// @param subtype
/// @param cook_rate
/// @param sweetness
/// @param sourness
/// @param bitterness
/// @param spiciness
/// @param pectin

var subtype = argument0;

var cook_rate = argument1;
var sweetness = argument2;
var sourness = argument3;
var bitterness = argument4;
var spiciness = argument5;
var pectin = argument6;

var effects = argument7;

ds_map_add(subtype, "cook_rate", cook_rate);
ds_map_add(subtype, "sweetness", sweetness);
ds_map_add(subtype, "sourness", sourness);
ds_map_add(subtype, "bitterness", bitterness);
ds_map_add(subtype, "pectin", pectin);
ds_map_add(subtype, "effects", effects);

