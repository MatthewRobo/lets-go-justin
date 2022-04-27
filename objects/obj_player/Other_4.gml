/// @description Insert description here
// You can write your code in this editor



gamepad = 0;
gamepad = global.lookup[team];

color = global.color[team];

recovery = instance_number(obj_controller) > 0 ? obj_controller.roundstart : recovery;
state = status.parried;

event_user(0);

if (global.lookup[team] == GP+KB && team >= 2) instance_deactivate_object(self);
else {
	boom = instance_create_layer(x, y, "hitboxes", obj_boom);
	boom.image_xscale = 2;
	boom.image_yscale = 2;
	boom.image_blend = color;
	boom = instance_create_layer(x, y, "hitboxes", obj_boom);
	boom.image_xscale = 2.6;
	boom.image_yscale = 2.6;
}

if (teammate != noone) teammate.teammate = self;
