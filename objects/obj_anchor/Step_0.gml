/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event

if (owner != noone) {
	hsp = lerp(hsp,owner.x-x-owner.hsp,lerpfactor);
	vsp = lerp(vsp,owner.y-y-owner.vsp,lerpfactor);
}

event_inherited();

