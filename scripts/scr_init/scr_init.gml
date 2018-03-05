randomize();

#macro GAMEDATA global.game_data
#macro UNIT 16

global.interact_stack = ds_stack_create();
global.item_library = ds_map_create();

global.small_digits = font_add_sprite_ext(spr_small_digits, "0123456789", true, 1);

scr_newgame();

enum CONTROLMODE {
	move,
	menu
}

enum MOVEDIR {
	undef=-1,
	right,
	up,
	left,
	down
}

enum ITEM {
	empty,
	
	// equipment
	pot,
	jar,
	
	// ingredients
	sugar,
	
	// fruit
	strawberry,
	grape,
	blackcurrent,
	raspberry,
	blackberry,
	boysenberry,
	apple,
	lemon,
	lime,
	orange,
	mandarin,
	bergamot,
	kumquat,
	apricot,
	plum,
	cherry,
	blueberry,
	
	// unusual
	cranberry,
	gooseberry,
	olive,
	pineapple,
	pear,
	mango,
	rhubarb,
	cucumber,
	
	// chutneys
	tomato,
	onion,
	redonion,
	ginger,
	chilli,
	beetroot,
	garlic,
	coconut,
	fig,
}

enum SUBTYPE {
	undef,
	equipment,
	ingredient,
	jam,
	whole,
	peeled,
	peel,
	chopped,
	pulp,
	juice,
}

var item = ds_map_create();
ds_map_add(item, "name", "Stockpot")
ds_map_add(item, "sprite", spr_pot);
ds_map_add(item, "subimage", 0);
ds_map_add(global.item_library, ITEM.pot, item);

var item = ds_map_create();
ds_map_add(item, "name", "Empty Jar")
ds_map_add(item, "sprite", spr_jar);
ds_map_add(item, "subimage", 0);
ds_map_add(global.item_library, ITEM.jar, item);

var item = ds_map_create();
ds_map_add(item, "name", "Sugar")
ds_map_add(item, "sprite", spr_sugar);
ds_map_add(item, "subimage", 0);
ds_map_add(global.item_library, ITEM.sugar, item);