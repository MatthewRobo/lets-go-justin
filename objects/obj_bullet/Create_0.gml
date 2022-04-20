/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

timer = 1080;
lifetime = 0;
grav = 0;
gravdir = 270;
maxspd = spd;


tlen = 10;
tcounter = 0;
trail = instance_create_layer(x,y,"trails",obj_shottrail);

trail.tx = array_create(tlen, x);
trail.ty = array_create(tlen, y);
trail.rotation = image_angle;

image_alpha = 0;
alarm[0] = 1;
