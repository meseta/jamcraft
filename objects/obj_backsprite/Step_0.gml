/// @description 

if(instance_exists(obj_control_encounter)) {
	if(obj_control_encounter.turn == TURN.player) {
		time++;
		xoff = 0*dcos(time*0.7);
		yoff = 2*dsin(time*0.9);
	}
}