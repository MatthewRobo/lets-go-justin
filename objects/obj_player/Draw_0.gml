/// @description Insert description here
// You can write your code in this editor



draw_self();
draw_set_colour(color);
draw_set_font(Font2);
draw_primitive_begin(pr_trianglelist);
draw_vertex(x, y-24);
draw_vertex(x-8, y-32);
draw_vertex(x+8, y-32);
draw_primitive_end();

draw_text(x, y-32, "(P" + teamstr + ")");
