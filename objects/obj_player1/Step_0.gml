/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event



left = false;
right = false;
down = false;
up = false;

if (global.down[team][input.L]
|| gamepad_button_check(gamepad, gp_padl)) {
	left = true;
} 
if (global.down[team][input.R]
|| gamepad_button_check(gamepad, gp_padr)) {
	right = true;
} else right = false;
if (global.down[team][input.U]
		|| gamepad_button_check(gamepad, gp_padu)) {
	up = true;
} else up = false;
if (global.down[team][input.D]
		|| gamepad_button_check(gamepad, gp_padd)) {
	down = true;
} else down = false;

if (global.pressed[team][input.JU]
		|| gamepad_button_check_pressed(gamepad, gp_face1)
		|| gamepad_button_check_pressed(gamepad, gp_shoulderl)) {
	jump = true;
}

if (global.down[team][input.JU]
		|| gamepad_button_check(gamepad, gp_face1)
		|| gamepad_button_check(gamepad, gp_shoulderl)) {
	hover = true;
} else hover = false;

if (global.released[team][input.JU]
		|| gamepad_button_check_released(gamepad, gp_face1)
		|| gamepad_button_check_released(gamepad, gp_shoulderl)) {
	uprelease = true;
	canhover = true;
}

if (global.pressed[team][input.PA]
		|| gamepad_button_check_pressed(gamepad, gp_face2)
		|| gamepad_button_check_pressed(gamepad, gp_shoulderr)) {
	parry = true;
} else if (global.pressed[team][input.SH]
		   || gamepad_button_check_pressed(gamepad, gp_face4)) {
	shoot = true;
} else if (global.pressed[team][input.SL]
		   || gamepad_button_check_pressed(gamepad, gp_face3)) {
	slash = true;
}

if (global.down[team][input.PA]
		|| gamepad_button_check(gamepad, gp_face2)
		|| gamepad_button_check(gamepad, gp_shoulderr)) {
	heldparry = true;
} else heldparry = false;

event_inherited();
gamepad_set_colour(gamepad, color);
