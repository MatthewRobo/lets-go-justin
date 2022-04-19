/// @description Insert description here
// You can write your code in this editor

if (global.hitstop <= 0) {
	tx[tcounter] = x;
	ty[tcounter] = y;
	tcounter++;
	tcounter = tcounter mod tlen;
	rotation = point_direction(0,0,hsp,vsp);
	if (decay) {
		timer--;
		if (timer < 0) instance_destroy();
	}
}
