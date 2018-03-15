/// @description 

obj_control_music.next_bgm = snd_bgm_battle;

ds_map_replace(GAMEDATA, "previous_room", room);
ds_map_replace(GAMEDATA, "current_room", rm_battle);
with(obj_warper) {
	fade_color = c_white;
	fade_rate_multiplier = 0.5;
	event_user(0);
}

select_inst = noone;
player_stat_inst = noone;
player_inst = noone;
enemy_inst = noone;
enemy_stat_inst = noone;

enemy_speed = 0;
player_speed = 0;


enemy_stat = ds_list_create();

fruit = undefined;
stars = 1;
cond = 0;

enum TURN {
	wait,
	player,
	enemy,
	system
}