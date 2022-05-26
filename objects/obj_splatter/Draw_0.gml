/// @description Insert description here
// You can write your code in this editor
draw_set_alpha(image_alpha);
//draw_set_color(global.bgcolor);
//draw_circle(x,y,radius,0);
draw_set_color(image_blend);

draw_circle(x,y,radius,0);

if (collision_circle(x,y,radius,obj_wall,0,0)) {
	if (instance_exists(obj_surface)) {
		
		if (surface_exists(obj_surface.surf)) {
			surface_set_target(obj_surface.surf);
			
			draw_circle(x,y,radius,0);
			
			surface_reset_target();
		}
	}
}
