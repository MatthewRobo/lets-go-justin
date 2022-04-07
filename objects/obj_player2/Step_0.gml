/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event



if (keyboard_check(vk_left)
		|| gamepad_button_check(gamepad, gp_padl)) {
	left = true;
} else left = false;
if (keyboard_check(vk_right)
		|| gamepad_button_check(gamepad, gp_padr)) {
	right = true;
} else right = false;
if (keyboard_check(vk_up)
		|| gamepad_button_check(gamepad, gp_padu)) {
	up = true;
} else up = false;
if (keyboard_check(vk_down)
		|| gamepad_button_check(gamepad, gp_padd)) {
	down = true;
} else down = false;

if (keyboard_check_pressed(vk_space)
		|| gamepad_button_check_pressed(gamepad, gp_face1)
		|| gamepad_button_check_pressed(gamepad, gp_shoulderl)) {
	jump = true;
}

if (keyboard_check(vk_space)
		|| gamepad_button_check(gamepad, gp_face1)
		|| gamepad_button_check(gamepad, gp_shoulderl)) {
	hover = true;
} else hover = false;

if (keyboard_check_released(vk_space)
		|| gamepad_button_check_released(gamepad, gp_face1)
		|| gamepad_button_check_released(gamepad, gp_shoulderl)) {
	uprelease = true;
	canhover = true;
}

if (keyboard_check_pressed(191)
		|| gamepad_button_check_pressed(gamepad, gp_face2)
		|| gamepad_button_check_pressed(gamepad, gp_shoulderr)) {
	parry = true;
} else if (keyboard_check_pressed(190)
		   || gamepad_button_check_pressed(gamepad, gp_face4)) {
	shoot = true;
} else if (keyboard_check_pressed(188)
		   || gamepad_button_check_pressed(gamepad, gp_face3)) {
	slash = true;
}

if (keyboard_check(191)
		|| gamepad_button_check(gamepad, gp_face2)
		|| gamepad_button_check(gamepad, gp_shoulderr)) {
	heldparry = true;
} else heldparry = false;
event_inherited();
gamepad_set_colour(gamepad, color);
