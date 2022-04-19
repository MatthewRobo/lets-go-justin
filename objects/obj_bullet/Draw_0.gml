/// @description Insert description here
// You can write your code in this editor

steps = 24;
hrad = sprite_width / 2;
vrad = sprite_height / 2;
outrad = 4;
rotation = point_direction(0,0,hsp,vsp);
draw_set_alpha(1);
draw_primitive_begin(pr_trianglefan);
for (i = 0; i <= 360; i += 360 / steps) {
	_x = lengthdir_x(hrad+outrad, i);
	_y = lengthdir_y(vrad+outrad, i);
	_c = dcos(rotation);
	_s = dsin(rotation);
	var _x2 = x + _c * _x + _s * _y;
	var _y2 = y + _c * _y - _s * _x;
	draw_vertex_colour(_x2, _y2,owner.color,1);
}
draw_primitive_end();
draw_primitive_begin(pr_trianglestrip);
for (i = 0; i < tlen; i+= 1) {
	tcnow = (i + tcounter + tlen) mod tlen;
	tcnext = (tcnow + 1 + tlen) mod tlen;
	tcdir = tdir[tcnow];
	//tcdir = point_direction(tx[tcnow],ty[tcnow],tx[tcnext],ty[tcnext]);
	//tdir = rotation;
	twid = sprite_height / 2 + outrad;
	talpha = i / tlen;

	x1 = tx[tcnow];
	y1 = ty[tcnow];
	
	x11 = x1+lengthdir_x(twid,tcdir+90);
	y11 = y1+lengthdir_y(twid,tcdir+90);
	x12 = x1+lengthdir_x(twid,tcdir-90);
	y12 = y1+lengthdir_y(twid,tcdir-90);

	if (global.hitstop > 0) talpha = 1;

	draw_vertex_colour(x11, y11,owner.color,talpha);
	draw_vertex_colour(x12, y12,owner.color,talpha);
	draw_circle(x11, y11,2,1);
	draw_circle(x12, y12,2,1);
	draw_text(x11,y11,i);
	draw_text(x12,y12,i);
	
}
//draw_vertex_colour(x12-24,y12,color,0);
draw_primitive_end();

draw_set_colour(c_white);
draw_primitive_begin(pr_trianglefan);
draw_vertex(x,y);
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
