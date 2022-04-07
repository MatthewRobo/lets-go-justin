/// @description Insert description here
// You can write your code in this editor

if (global.hitstop <= 0) {
/*
if (image_xscale > 0 && image_yscale > 0) {
	image_xscale -= random_range(0.05, 0.15);
	image_yscale -= random_range(0.05, 0.15);
} else instance_destroy();
*/

if (image_alpha > 0) image_alpha -= random_range(0.01, 0.05);
else instance_destroy();
} else image_alpha = 1;