/// @description 

time++;
xoff = 1*dcos(time*0.7);
yoff = 3*dsin(time*0.9);

if(animate_attack) {
	animate_attack_counter = 10;
	animate_attack = false;
}

if(animate_attack_counter > 0) {
	animate_attack_counter -= 1;
	
	xoff -= animate_attack_counter;
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
		xoff += animate_hit_counter/2;
	}
}