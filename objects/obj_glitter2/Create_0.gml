/// @description Insert description here
// You can write your code in this editor

timer = 240;
hspeed = irandom_range(1,10);
if (irandom(1)) hspeed *= -1;
image_alpha = 0;
alpha = 0;
thickness = irandom_range(1,10);
team = irandom(1);
if (global.mode == gamemode.teamvs) team = irandom(3);
