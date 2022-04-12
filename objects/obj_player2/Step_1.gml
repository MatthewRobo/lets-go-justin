/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if (autoparry) {
	nearby = instance_nearest(x, y, obj_hitbox);
	if (nearby != noone) {
		dist = point_distance(x, y, nearby.x, nearby.y);
		aprad = 32 + point_distance(0,0,nearby.hsp,nearby.vsp) * 2;
		
		if (dist <= aprad) parry = true;
	}
	state = status.parry;
}
