/// @description Insert description here
// You can write your code in this editor
color = x < room_width / 2 ? global.color[0] : global.color[1];
trail = instance_create_layer(x, y, "instances", obj_glitter2);
trail.image_blend = color;
if (irandom(1)) trail.image_blend = c_white;

trail.speed = random(10);
trail.image_index = random(8);
trail.friction = 0.1;
trail.direction = random(360);
trail.gravity = random_range(0.1, 0.15);
trail.gravity_direction = 270;

	trail.depth += 2;

trail.x = random_range(bbox_left, bbox_right);
trail.y = random_range(bbox_bottom, bbox_top);
