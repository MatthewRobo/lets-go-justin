/// @description Insert description here
// You can write your code in this editor

if (!global.paused) {

// Inherit the parent event
event_inherited();
if (grav != 0) {
	image_yscale = 0.5 * max(0.2,abs(dsin(20*lifetime)));
	image_xscale = 0.5;
}
else {
	windaffected = false;
	image_yscale = 0.25;
}
trail.color = global.color[team];
if (global.hitstop <= 0) cooldown--;

}