/// @description Insert description here
// You can write your code in this editor

timer--;
if (timer > 60) alpha = lerp(alpha,1,0.05);
else alpha = lerp(alpha,0,0.05);
if (timer < 0) instance_destroy();
