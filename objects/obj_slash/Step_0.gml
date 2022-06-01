/// @description Insert description here
// You can write your code in this editor

if (!global.paused) {

// Inherit the parent event
event_inherited();

if (global.hitstop <= 0) {
	if (true) {
	dx += hsp;
	dy += vsp;
	x = owner.x + dx;
	y = owner.y + dy;
	}
	
	image_yscale -= 0.2;
	if (image_yscale < 0.9) image_yscale = 0.9;


	trail = instance_create_layer(x, y, "trails", obj_slashtrail);
	trail.image_yscale = image_yscale;
	trail.image_angle = direction;
	trail.image_blend = owner.color;
	if (timer == 1) trail.sprite_index = spr_slashwhiff;
	
	timer--;
}

}