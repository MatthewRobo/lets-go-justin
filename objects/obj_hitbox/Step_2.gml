/// @description Insert description here
// You can write your code in this editor

if (!global.paused) {

if (collision_line(x,y,x-hsp,y-vsp,obj_wall,0,0) && lifetime > 1) {
//if (collision_line(x,y,x+hsp,y+vsp,obj_wall,0,0)) {
	x -= hsp;
	y -= vsp;
	dir = point_direction(0,0,hsp,vsp);
	var _hsp = lengthdir_x(1,dir);
	var _vsp = lengthdir_y(1,dir);
	while (!place_meeting(x+_hsp,y+_vsp,obj_wall)) {
		x += _hsp;
		y += _vsp;
	}
	instance_destroy();
}

}