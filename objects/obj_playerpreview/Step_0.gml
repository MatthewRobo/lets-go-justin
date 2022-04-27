/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

//clock++;

uprelease = false;
slash = false;
shoot = false;
parry = false;
jump = false;

threshold = 0.4;

if (!flip2) {
	left = dcos(clock) < -threshold;
	right = dcos(clock) > threshold;
} else {
	right = dcos(clock) < -threshold;
	left = dcos(clock) > threshold;
}
down = dsin(clock) < -threshold;
up = dsin(clock) > threshold;
hover = false;
heldparry = false;
teabag = false;

if (recovery <= 0 && canshoot) {
	shoot = true;
	canshoot = false;
	alarm[0] = 1;
	clock = floor(clock/45)*45;
	if (ammo > 0) clock+= 45;
}
