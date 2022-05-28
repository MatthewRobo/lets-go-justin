/// @description Insert description here
// You can write your code in this editor



gamepad = 0;
gamepad = global.lookup[team];

color = global.color[team];

if (instance_number(obj_controller) > 0) {
	roundstart =  obj_controller.roundstart;
	roundfreeze = obj_controller.roundfreeze;
	recovery = obj_controller.roundfreeze;
	state = status.parried;
}





event_user(0);

if (global.mode != gamemode.teamvs && team > 1) instance_destroy(self);
else {
	boom = instance_create_layer(x, y, "hitboxes", obj_boom);
	boom.image_xscale = 2;
	boom.image_yscale = 2;
	boom.image_blend = color;
	boom = instance_create_layer(x, y, "hitboxes", obj_boom);
	boom.image_xscale = 2.6;
	boom.image_yscale = 2.6;
}

if (teammate != noone) {
	teammate.teammate = self;
	teammate.allyteam = team;
	allyteam = teammate.team;
}
