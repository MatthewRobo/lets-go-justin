/// @description Insert description here
// You can write your code in this editor

draw_set_color(global.color[team]);
var _alpha = alpha * alpha2;
draw_set_alpha(_alpha);
draw_primitive_begin(pr_trianglestrip);
var steps = 24;
for (var t = -room_width/steps; t <= room_width+room_width/steps; t += room_width/steps) {
	_y = y+ 5*dsin(t/abs(hspeed)+x);
	draw_vertex(t,_y-thickness);
	draw_vertex(t,_y+thickness);
	//draw_circle(t+x,_y,thickness,0);
}
draw_primitive_end();
