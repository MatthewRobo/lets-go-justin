/// @description Insert description here
// You can write your code in this editor

draw_set_colour(c_aqua);
draw_primitive_begin(pr_trianglestrip);
draw_vertex(x11-w0,y11-w0);
draw_vertex(x21+w0,y12-w0);
draw_vertex(x12-w0,y21+w0);
draw_vertex(x22+w0,y22+w0);
draw_primitive_end();


draw_set_colour(c_white);
draw_set_alpha(1);
draw_rectangle(x1-w0, y1-w0, x2+w0, y2+w0, 0);



