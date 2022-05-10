/// @description Insert description here
// You can write your code in this editor

draw_set_color(global.color[team]);
draw_set_alpha(alpha);
draw_primitive_begin(pr_trianglestrip);
var steps = 24;
for (var t = 0; t <= room_width; t += room_width/steps) {
	_y = y+ 5*dsin(t/abs(hspeed)+x);
	draw_vertex(t,_y-thickness);
	draw_vertex(t,_y+thickness);
}
draw_primitive_end();
