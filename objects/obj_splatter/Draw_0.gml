/// @description Insert description here
// You can write your code in this editor
draw_set_alpha(image_alpha);
//draw_set_color(global.bgcolor);
//draw_circle(x,y,radius,0);
draw_set_color(image_blend);

//gpu_set_blendmode(bm_add);
draw_circle(x,y,radius,0);
//gpu_set_blendmode(bm_normal);
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

if (instance_exists(obj_surface) && surface_exists(obj_surface.surf)) {

	surface_set_target(obj_surface.surf);
	
	
	
	switch shape {
		case 0:
			draw_circle(x,y,r2,0); break;
		case 1:
			draw_primitive_begin(pr_trianglestrip);
			draw_vertex(_x1, _y1);
			draw_vertex(_x2, _y2);
			draw_vertex_color(lastx1,lasty1,image_blend,lastalpha);
			draw_vertex_color(lastx2,lasty2,image_blend,lastalpha);

			draw_primitive_end();
			break;
	}


	
	surface_reset_target();

}

lastx1 = _x1;
lastx2 = _x2;
lasty1 = _y1;
lasty2 = _y2;
