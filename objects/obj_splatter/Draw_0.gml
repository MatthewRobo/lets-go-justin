/// @description Insert description here
// You can write your code in this editor
draw_set_alpha(image_alpha);
//draw_set_color(global.bgcolor);
//draw_circle(x,y,radius,0);
draw_set_color(image_blend);

draw_circle(x,y,radius,0);
var r2 = radius/10;
x1 = x - r2;
y1 = y - r2;
x2 = x + r2;
y2 = y + r2;

//if (collision_circle(x,y,1,obj_wall,0,0)) {
if (
collision_point(x1,y1,obj_wall,0,0) &&
collision_point(x1,y2,obj_wall,0,0) &&
collision_point(x2,y2,obj_wall,0,0) &&
collision_point(x2,y1,obj_wall,0,0)
) {
	if (instance_exists(obj_surface)) {
		
		if (surface_exists(obj_surface.surf)) {
			surface_set_target(obj_surface.surf);
			
			draw_circle(x,y,r2,0);
			
			surface_reset_target();
		}
	}
}
