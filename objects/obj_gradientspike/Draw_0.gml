/// @description Insert description here
// You can write your code in this editor

draw_set_color(owner.color);
draw_set_alpha(image_alpha);

var _c = dcos(direction);
var _s = dsin(direction);

_x = length;
_y = thickness;
var _x1 = x + _c * _x + _s * _y;
var _y1 = y + _c * _y - _s * _x;

_y = -thickness;
var _x2 = x + _c * _x + _s * _y;
var _y2 = y + _c * _y - _s * _x;


draw_primitive_begin(pr_trianglelist);
draw_vertex(_x1,_y1);
draw_vertex(_x2,_y2);
draw_vertex_color(x,y,owner.color,0);
//draw_vertex_color(_x1,_y1,owner.color,0);
//draw_vertex_color(_x2,_y2,owner.color,0);
//draw_vertex_color(x,y,owner.color,image_alpha);
draw_primitive_end();

