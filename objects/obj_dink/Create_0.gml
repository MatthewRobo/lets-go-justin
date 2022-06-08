/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
gravity = 1;
gravity_direction = 270;
color = global.textcolor;


tlen = 5;
tcounter = 0;
trail = instance_create_layer(x,y,"trails",obj_shottrail);

trail.tlen = tlen;
trail.tx = array_create(tlen, x);
trail.ty = array_create(tlen, y);
trail.rotation = image_angle;

image_alpha = 0;
alarm[0] = 1;
