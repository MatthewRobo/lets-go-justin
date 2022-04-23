/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event

if (global.hitstop <= 0) {
	uprelease = false;
	slash = false;
	shoot = false;
	parry = false;
	jump = false;
}

left = false;
right = false;
down = false;
up = false;
hover = false;
heldparry = false;

if (global.down[gamepad][input.L]) {
	left = true;
} 
if (global.down[gamepad][input.R]) {
	right = true;
}
if (global.down[gamepad][input.U]) {
	up = true;
}
if (global.down[gamepad][input.D]) {
	down = true;
}

if (global.pressed[gamepad][input.JU]) {
	jump = true;
}

if (global.down[gamepad][input.JU]) {
	hover = true;
}

if (global.released[gamepad][input.JU]) {
	uprelease = true;
	canhover = true;
}

if (global.pressed[gamepad][input.PA]){
	parry = true;
} else if (global.pressed[gamepad][input.SH]) {
	shoot = true;
} else if (global.pressed[gamepad][input.SL]) {
	slash = true;
}

if (global.down[gamepad][input.PA]) {
	heldparry = true;
}

hvec = right - left;
vvec = down - up;
