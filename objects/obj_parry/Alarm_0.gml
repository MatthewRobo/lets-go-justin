/// @description Insert description here
// You can write your code in this editor
trail = instance_create_layer(x, y, "parrytrail", obj_parrytrail);
trail.image_angle = direction;
trail.image_blend = owner.color;
trail.owner = owner;