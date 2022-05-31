/// @description Insert description here
// You can write your code in this editor

if (!global.paused) {

	if (dot_product(hsp,vsp,maxhsp,maxvsp) > 0) {
		if (spd > maxspd) {
			instance_destroy();
		}
	}

}