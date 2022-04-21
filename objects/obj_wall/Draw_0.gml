/// @description Insert description here
// You can write your code in this editor

x1 = bbox_left ;
x2 = bbox_right;
y1 = bbox_top ;
y2 = bbox_bottom;

draw_set_alpha(1);
draw_set_colour(global.fgcolor);
draw_rectangle(x1,y1,x2,y2,0);
