/// @description Insert description here
// You can write your code in this editor
var xspawn = 0;
switch global.thingy {
	case thingies.wave: 
	alarm[0] = irandom_range(50,70); 
	xspawn = random(room_width);
	break;
	case thingies.rectangle:
	alarm[0] = irandom_range(6,10);
	xspawn = irandom(1) ? room_width : 0;
	break;
}

var yspawn = irandom(1) ? 0 : room_height;
yspawn += random_range(-128, 128);
if (yspawn > room_height) yspawn -= room_height;
else if (yspawn < 0) yspawn += room_height;
color = x < room_width / 2 ? global.color[0] : global.color[1];
trail = instance_create_layer(xspawn, yspawn, "instances", obj_thingy);
trail.image_blend = color;
//if (irandom(1)) trail.image_blend = c_white;

//trail.speed = random(10);
//trail.image_index = random(8);
//trail.friction = 0.1;
//trail.direction = random(360);
//trail.gravity = random_range(0.1, 0.15);
//trail.gravity_direction = 270;

trail.depth = layer_get_depth(layer_get_id("background"))-1;

//trail.x = random_range(bbox_left, bbox_right);
//trail.y = random_range(bbox_bottom, bbox_top);


//if (irandom(1)) trail.image_blend = c_white;


