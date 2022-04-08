/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();


if (global.hitstop <= 0) {
	if (timer <= 0) instance_destroy();
	timer--;
}
