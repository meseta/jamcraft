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
	pot_tiny,
	pot_small,
	pot_medium,
	pot_large,
	jar_tiny,
	jar_small,
	jar_medium,
	jar_large,
	
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
	
	// misc.
	mush,
}

enum SUBTYPE {
	undef,
	equipment,
	equipment_overlay,
	ingredient,
	jam,
	whole,
	peel,
	chopped,
	pulp,
	trash,
}

global.subtype_name = undefined;
global.subtype_name[SUBTYPE.undef] = "UNDEF"
global.subtype_name[SUBTYPE.equipment] = "Equipment"
global.subtype_name[SUBTYPE.ingredient] = "Ingredient"
global.subtype_name[SUBTYPE.jam] = "Jam"
global.subtype_name[SUBTYPE.whole] = "Whole"
global.subtype_name[SUBTYPE.peel] = "Peel"
global.subtype_name[SUBTYPE.chopped] = "Chopped"
global.subtype_name[SUBTYPE.pulp] = "Pulp"
global.subtype_name[SUBTYPE.trash] = "Trash"

enum PROPS {
	none = 0,
	choppable = 1,
	peelable = 2,
	cookable = 4,
	container = 8,
	cookware = 16,
	capacity_A = 32,
	capacity_B = 64,
	jar = 128,
	colorant = 256,
}



var item = scr_lib_create_item("Tiny Pan", ITEM.pot_tiny, c_gray);
scr_lib_create_subtype(item, SUBTYPE.equipment, spr_pot, 0, PROPS.cookware | PROPS.container);
scr_lib_create_subtype(item, SUBTYPE.equipment_overlay, spr_pot_overlay, 0, PROPS.none);
var item = scr_lib_create_item("Saucepan", ITEM.pot_small, c_gray);
scr_lib_create_subtype(item, SUBTYPE.equipment, spr_pot, 1, PROPS.cookware | PROPS.container | PROPS.capacity_A);
scr_lib_create_subtype(item, SUBTYPE.equipment_overlay, spr_pot_overlay, 1, PROPS.none);
var item = scr_lib_create_item("Jam Pan", ITEM.pot_medium, c_gray);
scr_lib_create_subtype(item, SUBTYPE.equipment, spr_pot, 2, PROPS.cookware | PROPS.container | PROPS.capacity_B);
scr_lib_create_subtype(item, SUBTYPE.equipment_overlay, spr_pot_overlay, 2, PROPS.none);
var item = scr_lib_create_item("Stockpot", ITEM.pot_large, c_gray);
scr_lib_create_subtype(item, SUBTYPE.equipment, spr_pot, 3, PROPS.cookware | PROPS.container | PROPS.capacity_A | PROPS.capacity_B);
scr_lib_create_subtype(item, SUBTYPE.equipment_overlay, spr_pot_overlay, 3, PROPS.none);
	
var item = scr_lib_create_item("Tiny Jar", ITEM.jar_tiny, c_ltgray);
scr_lib_create_subtype(item, SUBTYPE.equipment, spr_jar, 0, PROPS.jar | PROPS.container);
scr_lib_create_subtype(item, SUBTYPE.equipment_overlay, spr_jar_overlay, 0, PROPS.none);
var item = scr_lib_create_item("Small Jar", ITEM.jar_small, c_ltgray);
scr_lib_create_subtype(item, SUBTYPE.equipment, spr_jar, 1, PROPS.jar | PROPS.container | PROPS.capacity_A);
scr_lib_create_subtype(item, SUBTYPE.equipment_overlay, spr_jar_overlay, 0, PROPS.none);
var item = scr_lib_create_item("Jar", ITEM.jar_medium, c_ltgray);
scr_lib_create_subtype(item, SUBTYPE.equipment, spr_jar, 2, PROPS.jar | PROPS.container | PROPS.capacity_B);
scr_lib_create_subtype(item, SUBTYPE.equipment_overlay, spr_jar_overlay, 0, PROPS.none);
var item = scr_lib_create_item("Big Jar", ITEM.jar_large, c_ltgray);
scr_lib_create_subtype(item, SUBTYPE.equipment, spr_jar, 3, PROPS.jar | PROPS.container | PROPS.capacity_A | PROPS.capacity_B);
scr_lib_create_subtype(item, SUBTYPE.equipment_overlay, spr_jar_overlay, 0, PROPS.none);

var item = scr_lib_create_item("Sugar", ITEM.sugar, c_ltgray);
scr_lib_create_subtype(item, SUBTYPE.ingredient, spr_sugar, 0, PROPS.cookable);

var item = scr_lib_create_item("Strawberry", ITEM.strawberry, c_red);
scr_lib_create_subtype(item, SUBTYPE.whole, spr_strawberry, 0, PROPS.choppable);
scr_lib_create_subtype(item, SUBTYPE.chopped, spr_strawberry, 1, PROPS.cookable | PROPS.colorant);

var item = scr_lib_create_item("Lemon", ITEM.lemon, c_yellow);
scr_lib_create_subtype(item, SUBTYPE.whole, spr_lemon, 0, PROPS.choppable | PROPS.peelable);
scr_lib_create_subtype(item, SUBTYPE.peel, spr_lemon, 1, PROPS.cookable);
scr_lib_create_subtype(item, SUBTYPE.chopped, spr_lemon, 2, PROPS.cookable | PROPS.colorant);

var item = scr_lib_create_item("Mush", ITEM.mush, c_olive);
scr_lib_create_subtype(item, SUBTYPE.trash, spr_mush, 0, PROPS.colorant);