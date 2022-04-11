/// @description Insert description here
// You can write your code in this editor

if (global.hitstop <= 0) {
	image_index = irandom(7);
	if (image_index == 7) instance_destroy();
} else {
	image_speed = 2/30;
}
