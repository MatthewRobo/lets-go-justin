/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

spd = lerp(0, maxspd, abs(dsin(4 * timer)));
hsp = lengthdir_x(spd, direction);
vsp = lengthdir_y(spd, direction);
