randomize();

#macro GAMEDATA global.game_data
#macro UNIT 16

scr_newgame();

room_goto(GAMEDATA[? "current_room"]);

enum MOVEDIR {
	undef=-1,
	right,
	up,
	left,
	down
}