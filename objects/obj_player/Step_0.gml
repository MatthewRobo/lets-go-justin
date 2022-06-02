/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
gamepad = global.lookup[team];
color = global.color[team];
if (!global.paused) {

if (global.hitstop <= 0) {
	slash--;
	shoot--;
	parry--;
	jump--;
}

left = false;
right = false;
down = false;
up = false;
hover = false;
heldparry = false;
teabag = false;

if (global.released[gamepad][input.D]) {
	teabag = true;
}

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
	jump = buffer;
	canrelease = true;
}

jumpheld = global.down[gamepad][input.JU];

if (global.down[gamepad][input.JU]) {
	hover = true;
}

if (global.released[gamepad][input.JU]) {
	canhover = true;
}

if (global.pressed[gamepad][input.PA]){
	parry = buffer;
} else if (global.pressed[gamepad][input.SH]) {
	shoot = buffer;
} else if (global.pressed[gamepad][input.SL]) {
	slash = buffer;
}

if (global.down[gamepad][input.PA]) {
	heldparry = true;
}

hvec = right - left;
vvec = !up ? down : -up;

}
