/// @description Insert description here
// You can write your code in this editor

//if (global.hitstop <= 0) {
if (timer < 0.1) instance_destroy();
image_alpha = timer;
image_yscale = timer;
timer *= 0.9;
//}
