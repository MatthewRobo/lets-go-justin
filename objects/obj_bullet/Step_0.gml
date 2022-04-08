/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
if (collision_line(x,y,x+hsp,y+vsp,obj_wall,0,0)) {
	instance_destroy();
} else {


event_inherited();


trail = instance_create_layer(x, y, "trails", obj_bullettrail);
trail.image_angle = direction;
trail.image_blend = owner.color;

}
