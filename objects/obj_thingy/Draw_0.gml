/// @description Insert description here
// You can write your code in this editor

draw_set_color(global.color[team]);
var _alpha = alpha * alpha2 * alphamax;
draw_set_alpha(_alpha);
draw_primitive_begin(pr_trianglestrip);
var steps = 24;
if (global.thingy == thingies.wave) {
for (var t = -room_width/steps; t <= room_width+room_width/steps; t += room_width/steps) {
	_y = y+ amp*dsin(t/abs(hspeed)+x);
	var dist = abs(t - x + xoffset)/room_width * thickness2;
	draw_vertex(t,_y-thickness-dist);
	draw_vertex(t,_y+thickness+dist);
	//draw_circle(t+x,_y,thickness,0);
}
} else {
	draw_rectangle(x,y-thickness,x+hspeed*24,y+thickness,0);
}
//var _x = x;
//var _a = 1;
//repeat(steps) {
//	draw_vertex_color(_x,y-thickness,global.color[team],_a*_alpha);
//	draw_vertex_color(_x,y+thickness,global.color[team],_a*_alpha);
//	_x -= hspeed;
//	_a -= 1/steps;
//}
draw_primitive_end();
