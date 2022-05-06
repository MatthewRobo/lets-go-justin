/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event

event_inherited();

if (global.hitstop <= 0) {
	if (dot_product(hsp,vsp,maxhsp,maxvsp) > 0) {
		if (spd > maxspd) {
			hsp *= maxspd / spd;
			vsp *= maxspd / spd;
		}
	}
	if (image_xscale < maxsize) image_xscale += 0.04;
	image_yscale = image_xscale;
}
