/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event

if (global.hitstop <= 0) {
	spd = point_distance(0,0,hsp,vsp);
	if (spd > maxspd) {
		hsp *= maxspd / spd;
		vsp *= maxspd / spd;
	}
	if (image_xscale < maxsize) image_xscale += 0.025;
	image_yscale = image_xscale;
	x += hsp;
	y += vsp;
}

trail = instance_create_layer(x, y, "trails", obj_bullettrail);
trail.image_angle = direction;
trail.image_blend = owner.color;
trail.image_xscale = image_xscale;
trail.image_yscale = image_yscale;


if (global.hitstop <= 0) {
	if (timer <= 0) instance_destroy();
	timer--;
	vsp += lengthdir_y(grav, gravdir);
	hsp += lengthdir_x(grav, gravdir);

}
