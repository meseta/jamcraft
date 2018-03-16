/// @description 

if(not is_undefined(fruit)) {
	if(irandom(99) < chance) {
		scr_debug("Encounter!")
		
		// calculate difficulty
		var inst_encounter = instance_create_depth(x, y, 10000, obj_control_encounter)
		inst_encounter.enemy_fruit = fruit;
		inst_encounter.enemy_stars = clamp(difficulty + choose(-1, 0, 1), 1, 5);
		inst_encounter.enemy_cond = random_range(35,100);
	}	
}