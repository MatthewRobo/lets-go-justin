/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();
lasthit = noone;
windaffected = true;
cooldown = 0;



var glitter = instance_create_depth(x, y, depth-1, obj_glitter);
//glitter.image_blend = irandom(1) ? global.fgcolor2 : owner.color;
glitter.image_blend = c_white;
glitter.scale = 4;
glitter.rng = false;