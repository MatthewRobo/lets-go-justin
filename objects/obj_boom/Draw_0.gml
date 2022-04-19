/// @description Insert description here
// You can write your code in this editor

hrad = sprite_width / 2;
vrad = sprite_height / 2;

steps = 24;
draw_set_color(c_white);
draw_set_alpha(1);
draw_primitive_begin(pr_trianglestrip);
for (i = 0; i <= 360; i += 360 / steps) {
	_xi = lengthdir_x(hrad*irad, i);
	_yi = lengthdir_y(vrad*irad, i);
	
	_xo = lengthdir_x(hrad*orad, i);
	_yo = lengthdir_y(vrad*orad, i);
	
	_c = dcos(image_angle);
	_s = dsin(image_angle);

	var _x1 = x + _c * _xi + _s * _yi;
	var _y1 = y + _c * _yi - _s * _xi;
	var _x2 = x + _c * _xo + _s * _yo;
	var _y2 = y + _c * _yo - _s * _xo;

	draw_vertex(_x1, _y1);
	draw_vertex(_x2, _y2);
}
draw_primitive_end();
