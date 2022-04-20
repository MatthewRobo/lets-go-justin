/// @description Insert description here
// You can write your code in this editor

if (global.hitstop <= 0) {
	x += hsp;
	y += vsp;
	ray = collision_line(x,y,x-hsp,y-vsp,obj_player,0,0);
	if (ray != noone) {
		if (ray.team != team && ray.invul <= 0) {
			x = ray.x;
			y = ray.y;
		}
	}
	
}