randomize();

#macro GAMEDATA global.game_data
#macro UNIT 16

global.interact_stack = ds_stack_create();
global.item_library = ds_map_create();

global.small_digits = font_add_sprite_ext(spr_small_digits, "0123456789", true, 1);

scr_newgame();

instance_create_layer(0, 0, "UI", obj_control_camera);
instance_create_layer(0, 0, "UI", obj_control_input);
instance_create_layer(0, 0, "UI", obj_control_room_inventory);
instance_create_layer(0, 0, "UI", obj_warper);
instance_create_layer(0, 0, "UI", obj_control_music);
instance_create_layer(0, 0, "Instances", obj_player);



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
	
	
	strawberry,
	grape,
	apple,
	apricot,
	plum,
	cherry,
	pear,
	
	// forest
	raspberry,
	blackcurrent,
	blackberry,
	boysenberry,
	cranberry,
	gooseberry,
	blueberry,
	
	// citrus 
	lemon,
	lime,
	orange,
	mandarin,
	bergamot,
	kumquat,
	
	// tropical
	pineapple,
	mango,
	coconut,
	kiwi,
	pomegranate,
	
	// chutney
	tomato,
	onion,
	redonion,
	ginger,
	chilli,
	beetroot,
	garlic,
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
	choppable	= (1 << 0),
	peelable	= (1 << 1),
	cookable	= (1 << 2),
	container	= (1 << 3),
	cookware	= (1 << 4),
	capacity_A	= (1 << 5),
	capacity_B	= (1 << 6),
	jar			= (1 << 7),
	colorant	= (1 << 8),
}

enum EFFECTS {
	none = 0,
	healing		= (1 << 1),
	acid		= (1 << 2),
	toxic		= (1 << 3),
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
var subtype = scr_lib_create_subtype(item, SUBTYPE.ingredient, spr_sugar, 0, PROPS.cookable);
scr_lib_subtype_cooking(subtype, 1, 50, 0, 0, 0, 0, EFFECTS.none);

var item = scr_lib_create_item("Strawberry", ITEM.strawberry, c_red);
scr_lib_create_subtype(item, SUBTYPE.whole, spr_strawberry, 0, PROPS.choppable);
var subtype = scr_lib_create_subtype(item, SUBTYPE.chopped, spr_strawberry, 1, PROPS.cookable | PROPS.colorant);
scr_lib_subtype_cooking(subtype, 1.2, 50, 10, 0, 0, 25, EFFECTS.healing);

var item = scr_lib_create_item("Lemon", ITEM.lemon, c_yellow);
scr_lib_create_subtype(item, SUBTYPE.whole, spr_lemon, 0, PROPS.choppable | PROPS.peelable);
var subtype = scr_lib_create_subtype(item, SUBTYPE.peel, spr_lemon, 1, PROPS.cookable);
scr_lib_subtype_cooking(subtype, 0.5, 0, 30, 100, 0, 100, EFFECTS.acid);
var subtype = scr_lib_create_subtype(item, SUBTYPE.chopped, spr_lemon, 2, PROPS.cookable | PROPS.colorant);
scr_lib_subtype_cooking(subtype, 0.8, 15, 100, 0, 0, 75, EFFECTS.acid);

var item = scr_lib_create_item("Mush", ITEM.mush, c_olive);
var subtype = scr_lib_create_subtype(item, SUBTYPE.trash, spr_mush, 0, PROPS.colorant);
scr_lib_subtype_cooking(subtype, 0, 0, 200, 300, 0, 0, EFFECTS.toxic);

var export_str = json_encode(global.item_library);
var file = file_text_open_write("inventory.json");
file_text_write_string(file,export_str);
file_text_close(file);

var export_str = json_encode(GAMEDATA);
var file = file_text_open_write("gamedata.json");
file_text_write_string(file,export_str);
file_text_close(file);
