/// @description Insert description here
// You can write your code in this editor
draw_set_alpha(image_alpha);
//draw_set_color(global.bgcolor);
//draw_circle(x,y,radius,0);
draw_set_color(image_blend);

draw_circle(x,y,radius,0);
//var r1 = max(4,radius / 2);
//draw_line_width(x,y,x+hspeed,y+vspeed,r1);
var r2 = max(2,radius/8);
x1 = x - r2;
y1 = y - r2;
x2 = x + r2;
y2 = y + r2;

var angle, dx, dy, _x1, _x2, _y1, _y2;

angle = direction + 90;
dx = lengthdir_x(r2,angle);
dy = lengthdir_y(r2,angle);

_x1 = x - dx;
_x2 = x + dx;
_y1 = y - dy;
_y2 = y + dy;

if (instance_exists(obj_surface) && surface_exists(obj_surface.surf) && r2 < 64) {
	//if (
	//collision_point(x,y,obj_wall,0,0) &&
	//collision_point(x1,y1,obj_wall,0,0) &&
	//collision_point(x1,y2,obj_wall,0,0) &&
	//collision_point(x2,y2,obj_wall,0,0) &&
	//collision_point(x2,y1,obj_wall,0,0)
	//) {
	//	surface_set_target(obj_surface.surf);
	//	draw_circle(x,y,r2,0);
	//	surface_reset_target();
	//}

	//if (
	//collision_point(x,y,obj_wall,0,0) &&
	//collision_point(x+hspeed,y,obj_wall,0,0) &&
	//collision_point(x,y+vspeed,obj_wall,0,0) &&
	//collision_point(x+hspeed,y+vspeed,obj_wall,0,0)
	//) {
	//	surface_set_target(obj_surface.surf);
	//	draw_line_width(x,y,x+hspeed,y+vspeed,r2*2);
	//	surface_reset_target();
	//}
	
	if (collision_point(x,y,obj_wall,0,0)) {
		surface_set_target(obj_surface.surf);
		draw_primitive_begin(pr_trianglestrip);
		if collision_point(_x1,_y1,obj_wall,0,0) draw_vertex(_x1, _y1);
		if collision_point(_x2,_y2,obj_wall,0,0) draw_vertex(_x2, _y2);
		if collision_point(lastx1,lasty1,obj_wall,0,0) draw_vertex(lastx1,lasty1);
		if collision_point(lastx2,lasty2,obj_wall,0,0) draw_vertex(lastx2,lasty2);
		draw_primitive_end();
		surface_reset_target();
	}

}

lastx1 = _x1;
lastx2 = _x2;
lasty1 = _y1;
lasty2 = _y2;
