/// @description Insert description here
// You can write your code in this editor

if (collision_line(x,y,x+hsp,y+vsp,obj_wall,0,0)) {
	//x -= hsp;
	//y -= vsp;
	while (!place_meeting(x,y,obj_wall)) {
		dir = point_direction(0,0,hsp,vsp);
		x += lengthdir_x(1,dir);
		y += lengthdir_y(1,dir);
	}
	instance_destroy();
}
