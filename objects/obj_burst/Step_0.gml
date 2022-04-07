/// @description Insert description here
// You can write your code in this editor

if (timer < 0) instance_destroy();
else image_alpha = timer;

image_xscale = 1 + (1 - timer);

timer *= 0.8;
