/// @description Insert description here
// You can write your code in this editor

if (!global.paused) {

// Inherit the parent event
var _lifetime = dsin(20*lifetime)
event_inherited();
if (grav != 0) {
	//var _lifetime2 = dsin(20*lifetime);
	//if (sign(_lifetime) != sign(_lifetime2)) {
		var _x, _y;
		_x = x+lengthdir_x(8, 47*lifetime);
		_y = y+lengthdir_y(8, 47*lifetime);
		var glitter = instance_create_depth(_x, _y, depth-1, obj_glitter);
		if (irandom(1)) glitter.image_blend = owner.color;
		//glitter.image_blend = irandom(1) ? global.fgcolor2 : owner.color;
		//glitter.image_blend = irandom(1) ? global.fgcolor2 : c_white;
		//if (! (lifetime mod 2)) glitter.image_blend = global.fgcolor2;
		//if (irandom(1)) glitter.sprite_index = spr_blob;
		if (lifetime mod 2) glitter.sprite_index = spr_blob;
		//glitter.scale = 2;
		//glitter.rng = false;
	//}
	image_yscale = 0.5 * max(0.2,abs(_lifetime));
	image_xscale = 0.5;
}
else {
	windaffected = false;
	image_yscale = 0.25;
}
trail.color = global.color[team];
if (global.hitstop <= 0) cooldown--;

}

