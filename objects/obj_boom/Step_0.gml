/// @description Insert description here
// You can write your code in this editor

timer++;
if (timer > life) instance_destroy();

orad = clamp(2 * timer / life,0,1);
irad = timer / life;
