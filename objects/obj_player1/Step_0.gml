/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event



if (keyboard_check(ord("A"))
		|| gamepad_button_check(xinput, gp_padl)
		|| gamepad_button_check(dinput, gp_padl)) {
	left = true;
} else left = false;
if (keyboard_check(ord("D"))
		|| gamepad_button_check(xinput, gp_padr)
		|| gamepad_button_check(dinput, gp_padr)) {
	right = true;
} else right = false;
if (keyboard_check(ord("W"))
		|| gamepad_button_check(xinput, gp_padu)
		|| gamepad_button_check(dinput, gp_padu)) {
	up = true;
} else up = false;
if (keyboard_check(ord("S"))
		|| gamepad_button_check(xinput, gp_padd)
		|| gamepad_button_check(dinput, gp_padd)) {
	down = true;
} else down = false;

if (keyboard_check_pressed(ord("C"))
		|| gamepad_button_check_pressed(xinput, gp_face1)
		|| gamepad_button_check_pressed(dinput, gp_face1)
		|| gamepad_button_check_pressed(xinput, gp_shoulderl)
		|| gamepad_button_check_pressed(dinput, gp_shoulderl)) {
	jump = true;
}

if (keyboard_check(ord("C"))
		|| gamepad_button_check(xinput, gp_face1)
		|| gamepad_button_check(dinput, gp_face1)
		|| gamepad_button_check(xinput, gp_shoulderl)
		|| gamepad_button_check(dinput, gp_shoulderl)) {
	hover = true;
} else hover = false;

if (keyboard_check_released(ord("C"))
		|| gamepad_button_check_released(xinput, gp_face1)
		|| gamepad_button_check_released(dinput, gp_face1)
		|| gamepad_button_check_released(xinput, gp_shoulderl)
		|| gamepad_button_check_released(dinput, gp_shoulderl)) {
	uprelease = true;
	canhover = true;
}

if (keyboard_check_pressed(ord("H"))
		|| gamepad_button_check_pressed(xinput, gp_face2)
		|| gamepad_button_check_pressed(dinput, gp_face2)
		|| gamepad_button_check_pressed(xinput, gp_shoulderr)
		|| gamepad_button_check_pressed(dinput, gp_shoulderr)) {
	parry = true;
} else if (keyboard_check_pressed(ord("G"))
		   || gamepad_button_check_pressed(xinput, gp_face4)
		   || gamepad_button_check_pressed(dinput, gp_face4)) {
	shoot = true;
} else if (keyboard_check_pressed(ord("F"))
		   || gamepad_button_check_pressed(xinput, gp_face3)
		   || gamepad_button_check_pressed(dinput, gp_face3)) {
	slash = true;
}

event_inherited();

