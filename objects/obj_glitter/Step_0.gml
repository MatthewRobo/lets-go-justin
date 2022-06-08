/// @description Insert description here
// You can write your code in this editor

//if (!global.paused) {

if (global.hitstop <= 0 || global.paused) {
	timer--;
	if (rng) {
		image_index = irandom(7);
		image_xscale = scale * random_range(0.5, 2);
	} else {
		image_xscale = scale;
		image_speed = 1;
	}
	if (image_index == 7 && timer <= 0) instance_destroy();
	image_yscale = image_xscale;
} else {
	image_speed = 2/30;
}

//}
