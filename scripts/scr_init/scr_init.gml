randomize();

#macro GAMEDATA global.game_data
#macro UNIT 16

global.interact_stack = ds_stack_create();

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
	normal,
	equipment,
	ingredient,
	whole,
	peeled,
	peel,
	chopped,
	pulp,
	juice
}