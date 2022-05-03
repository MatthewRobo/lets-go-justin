/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();


if (global.hitstop <= 0) {
	activetrail = instance_create_layer(x,y,"hitboxes",obj_activetrail);
	activetrail.timer = 120;
	activetrail.owner = owner;
	activetrail.team = team;
	activetrail.direction = direction;
}
