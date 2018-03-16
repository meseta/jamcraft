/// @description 

xoff = 0;
yoff = 0;
if(instance_exists(obj_control_encounter)) {
	if(obj_control_encounter.turn == TURN.player) {
		time++;
		xoff = 0*dcos(time*0.7);
		yoff = 2*dsin(time*0.9);
	}
}

if(animate_attack) {
	animate_attack_counter = 20;
	animate_attack = false;
	
	audio_play_sound(snd_fx_hit2, 20, false);
}

if(animate_attack_counter > 0) {
	animate_attack_counter -= 1;
	
	xoff += animate_attack_counter/2;
}




if(animate_hit) {
	animate_hit_counter = 40;
	animate_hit = false;
}

if(animate_hit_counter > 0) {
	animate_hit_counter -= 1;
	if(animate_hit_counter <= 20) {
		if(animate_hit_counter == 20) {
			audio_play_sound(snd_fx_hit1, 20, false);	
		}
		xoff -= animate_hit_counter/2;
	}
}