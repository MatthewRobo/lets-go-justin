/// @description Insert description here
// You can write your code in this editor

draw_set_colour(global.outline);
if (abs(global.hitstop - global.peakstop) < 2) draw_set_color(global.fgcolor2);
if (!GREYBOX) {
draw_set_alpha(1)
draw_primitive_begin(pr_trianglestrip);
draw_vertex(round(x11-w0),round(y11-w0));
draw_vertex(round(x21+w0),round(y12-w0));
draw_vertex(round(x12-w0),round(y21+w0));
draw_vertex(round(x22+w0),round(y22+w0));
draw_primitive_end();



if (global.hitstop <= 0) draw_set_colour(global.fgcolor2);

draw_set_alpha(1);
draw_rectangle(round(x1-_w0),
               round(y1-_w0),
               round(x2+_w0),
               round(y2+_w0), 0);
}


