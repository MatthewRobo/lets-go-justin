/// @description Insert description here
// You can write your code in this editor

if (global.hitstop <= 0) {
	timer--;
	image_index = irandom(7);
	if (image_index == 7 && timer <= 0) instance_destroy();
	image_xscale = scale * random_range(0.5, 2);
	image_yscale = image_xscale;	
} else {
	image_speed = 2/30;
}
