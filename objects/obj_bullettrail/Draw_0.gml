/// @description Insert description here
// You can write your code in this editor

steps = 24;
hrad = sprite_width / 2;
vrad = sprite_height / 2;
draw_set_alpha(image_alpha);
draw_set_colour(image_blend);
draw_primitive_begin(pr_trianglefan);
draw_vertex(x,y);
rotation = image_angle;
for (i = 0; i <= 360; i += 360 / steps) {
	_x = lengthdir_x(hrad, i);
	_y = lengthdir_y(vrad, i);
	_c = dcos(rotation);
	_s = dsin(rotation);
	var _x2 = x + _c * _x + _s * _y;
	var _y2 = y + _c * _y - _s * _x;
	draw_vertex(_x2, _y2);
}
draw_primitive_end();
