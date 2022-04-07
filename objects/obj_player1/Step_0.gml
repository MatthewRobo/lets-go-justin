/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event



if (keyboard_check(ord("A"))
		|| gamepad_button_check(gamepad, gp_padl)) {
	left = true;
} else left = false;
if (keyboard_check(ord("D"))
		|| gamepad_button_check(gamepad, gp_padr)) {
	right = true;
} else right = false;
if (keyboard_check(ord("W"))
		|| gamepad_button_check(gamepad, gp_padu)) {
	up = true;
} else up = false;
if (keyboard_check(ord("S"))
		|| gamepad_button_check(gamepad, gp_padd)) {
	down = true;
} else down = false;

if (keyboard_check_pressed(ord("C"))
		|| gamepad_button_check_pressed(gamepad, gp_face1)
		|| gamepad_button_check_pressed(gamepad, gp_shoulderl)) {
	jump = true;
}

if (keyboard_check(ord("C"))
		|| gamepad_button_check(gamepad, gp_face1)
		|| gamepad_button_check(gamepad, gp_shoulderl)) {
	hover = true;
} else hover = false;

if (keyboard_check_released(ord("C"))
		|| gamepad_button_check_released(gamepad, gp_face1)
		|| gamepad_button_check_released(gamepad, gp_shoulderl)) {
	uprelease = true;
	canhover = true;
}

if (keyboard_check_pressed(ord("H"))
		|| gamepad_button_check_pressed(gamepad, gp_face2)
		|| gamepad_button_check_pressed(gamepad, gp_shoulderr)) {
	parry = true;
} else if (keyboard_check_pressed(ord("G"))
		   || gamepad_button_check_pressed(gamepad, gp_face4)) {
	shoot = true;
} else if (keyboard_check_pressed(ord("F"))
		   || gamepad_button_check_pressed(gamepad, gp_face3)) {
	slash = true;
}

if (keyboard_check(ord("H"))
		|| gamepad_button_check(gamepad, gp_face2)
		|| gamepad_button_check(gamepad, gp_shoulderr)) {
	heldparry = true;
} else heldparry = false;

event_inherited();
gamepad_set_colour(gamepad, color);
