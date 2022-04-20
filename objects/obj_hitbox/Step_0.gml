/// @description Insert description here
// You can write your code in this editor

if (global.hitstop <= 0) {
	ray = collision_line(x,y,x-hsp,y-vsp,obj_player,0,0);
	if (ray != noone && ray.team != team && ray.invul <= 0) {
			while (!place_meeting(x,y,ray)) {
				dir = point_direction(0,0,hsp,vsp);
				x += lengthdir_x(1,dir);
				y += lengthdir_y(1,dir);
			}
	} else {
		x += hsp;
		y += vsp;
	}
}