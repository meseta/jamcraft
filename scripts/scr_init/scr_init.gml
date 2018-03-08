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

global.subtype_name = undefined;
global.subtype_name[SUBTYPE.undef] = "UNDEF"
global.subtype_name[SUBTYPE.equipment] = "Equipment"
global.subtype_name[SUBTYPE.ingredient] = "Ingredient"
global.subtype_name[SUBTYPE.jam] = "Jam"
global.subtype_name[SUBTYPE.whole] = "Whole"
global.subtype_name[SUBTYPE.peeled] = "Peeled"
global.subtype_name[SUBTYPE.peel] = "Peel"
global.subtype_name[SUBTYPE.chopped] = "Chopped"
global.subtype_name[SUBTYPE.pulp] = "Pulp"
global.subtype_name[SUBTYPE.juice] = "Juice"

enum PROPS {
	none = 0,
	choppable = 1,
	peelable = 2,
	cookable = 4
}

var item = scr_inv_create_item("Stockpot", ITEM.pot, c_gray);
scr_inv_create_subtype(item, SUBTYPE.equipment, spr_pot, 0, PROPS.none);

var item = scr_inv_create_item("Empty Jar", ITEM.jar, c_ltgray);
scr_inv_create_subtype(item, SUBTYPE.equipment, spr_jar, 0, PROPS.none);

var item = scr_inv_create_item("Sugar", ITEM.sugar, c_ltgray);
scr_inv_create_subtype(item, SUBTYPE.ingredient, spr_sugar, 0, PROPS.none);

var item = scr_inv_create_item("Strawberry", ITEM.strawberry, c_red);
scr_inv_create_subtype(item, SUBTYPE.whole, spr_strawberry, 0, PROPS.choppable);

var item = scr_inv_create_item("Lemon", ITEM.lemon, c_yellow);
scr_inv_create_subtype(item, SUBTYPE.whole, spr_lemon, 0, PROPS.peelable);
scr_inv_create_subtype(item, SUBTYPE.juice, spr_lemon, 1, PROPS.cookable);