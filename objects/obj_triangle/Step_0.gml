/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

spd = lerp(0, maxspd, (-abs((lifetime mod cycle)-cycle/2)+cycle/2) / (cycle / 2));
hsp = lengthdir_x(spd, direction);
vsp = lengthdir_y(spd, direction);
