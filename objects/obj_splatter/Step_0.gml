/// @description Insert description here
// You can write your code in this editor


if (owner != noone) {
	target = owner.dead ? owner.spawnpoint : owner;
	tx = target.x;
	ty = target.y;
}

lastalpha =  image_alpha;

if (image_alpha > 1) decay = true;
if (!decay) image_alpha += alphainc;
	if decay {
		timer--;
		radius *= 0.9;
	} else {
		radius *= 1.025;
	}
	if (timer < 0) image_alpha -= 0.1;
	if (image_alpha < 0) instance_destroy();

gravity = 1.12;
gravity_direction=point_direction(x,y,tx,ty);

//if (instance_place(x,y+vspeed,obj_wall)) vspeed *= -1;
//if (instance_place(x+hspeed,y,obj_wall)) hspeed *= -1;
