/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();


if (global.hitstop <= 0) {
	trail = instance_create_layer(x,y,"hitboxes",obj_activetrail);
	trail.timer = 120;
	trail.owner = owner;
	trail.team = team;
}
