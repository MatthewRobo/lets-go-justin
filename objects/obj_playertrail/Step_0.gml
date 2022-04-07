/// @description Insert description here
// You can write your code in this editor

if (global.hitstop <= 0) {

	if (timer < 0) instance_destroy();
	timer -= 0.1;
	if (timer < 0.6) image_alpha -= 0.2;
}
else {
	timer = 1;
	image_alpha = 1;
}
