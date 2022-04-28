/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event

event_inherited();

if (global.hitstop <= 0) {
	vsp += lengthdir_y(grav, gravdir);
	hsp += lengthdir_x(grav, gravdir);
	
	image_angle = point_direction(0,0,hsp,vsp);
	/*
	trail = instance_create_layer(x, y, "trails", obj_bullettrail);
	trail.image_angle = image_angle;
	trail.image_blend = owner.color;
	trail.image_xscale = image_xscale;
	trail.image_yscale = image_yscale;
	*/
	
	
	trail.image_xscale = image_xscale;
	trail.image_yscale = image_yscale;
	trail.x = x;
	trail.y = y;
	trail.color = owner.color;
	trail.rotation = image_angle;
	trail.hsp = hsp;
	trail.vsp = vsp;

}
