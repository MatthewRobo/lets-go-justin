/// @description Insert description here
// You can write your code in this editor

if (!global.paused) {

// Inherit the parent event
event_inherited();


if (global.hitstop <= 0) {
	activetrail = instance_create_layer(x,y,"hitboxes",obj_activetrail);
	activetrail.timer = 120;
	activetrail.owner = owner;
	activetrail.team = team;
	activetrail.direction = direction;
	activetrail.hsp = lengthdir_x(0.001,direction);
	activetrail.vsp = lengthdir_y(0.001,direction);
}

}