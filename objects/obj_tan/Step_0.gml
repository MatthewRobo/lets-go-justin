/// @description Insert description here
// You can write your code in this editor

if (!global.paused) {

// Inherit the parent event
event_inherited();

a = 4*lifetime;
if (abs (a mod 180) == 90) a += 5;

spd = lerp(0, maxspd, abs(dtan(a)));
hsp = lengthdir_x(spd, direction);
vsp = lengthdir_y(spd, direction);

}