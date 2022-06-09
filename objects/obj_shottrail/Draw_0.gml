/// @description Insert description here
// You can write your code in this editor

steps = 24;
hrad = sprite_width / 2;
vrad = sprite_height / 2;
outrad = 4;
var outradbig = outrad;
if (embiggen) {
	outradbig += min(48,global.hitstop*global.hitstop * 0.25);
}


draw_set_alpha(1*!GREYBOX);
draw_set_color(color);

draw_primitive_begin(pr_trianglestrip);
twid = sprite_height / 2 + outrad;
for (i = 0; i < tlen; i+= 1) {
	tcnow = (i + tcounter + tlen) mod tlen;
	tcnext = (tcnow + 1 + tlen) mod tlen;
	//tcdir = tdir[tcnow];
	twid = sprite_height / 2 + outrad;
	tcdir = tcnext == tcounter ? rotation : point_direction(tx[tcnow],ty[tcnow],tx[tcnext],ty[tcnext]);
	//tdir = rotation;
	if (point_distance(tx[tcnow],ty[tcnow],tx[tcnext],ty[tcnext]) == 0) {
		tcdir = rotation;
	}

	talpha = i / tlen;

	x1 = tx[tcnow];
	y1 = ty[tcnow];
	
	if (global.hitstop > 0) {
		talpha = i;
		
	}

	x11 = x1+lengthdir_x(twid,tcdir+90);
	y11 = y1+lengthdir_y(twid,tcdir+90);
	x12 = x1+lengthdir_x(twid,tcdir-90);
	y12 = y1+lengthdir_y(twid,tcdir-90);


	talpha*=!GREYBOX;
	draw_vertex_colour(x11, y11,color,talpha);
	draw_vertex_colour(x12, y12,color,talpha);
	//draw_circle(x11, y11,2,1);
	//draw_circle(x12, y12,2,1);
	//draw_text(x11,y11,i);
	//draw_text(x12,y12,i);
	
}
//draw_vertex_colour(x12-24,y12,color,0);

x11 = x+lengthdir_x(twid,rotation+90);
y11 = y+lengthdir_y(twid,rotation+90);
x12 = x+lengthdir_x(twid,rotation-90);
y12 = y+lengthdir_y(twid,rotation-90);

talpha = global.hitstop > 0 ? 1 : timer / tlen;

draw_vertex_colour(x11, y11,color,talpha);
draw_vertex_colour(x12, y12,color,talpha);
	
draw_primitive_end();

draw_set_alpha(timer / tlen);
draw_primitive_begin(pr_trianglefan);
//angle = point_distance(0,0,hsp,vsp) == 0 ? 360 : 180;
angle = 360;

for (i = -angle/2; i <= angle/2; i += 360 / steps) {
	_x = lengthdir_x(hrad+outradbig, i);
	_y = lengthdir_y(vrad+outradbig, i);
	_c = dcos(rotation);
	_s = dsin(rotation);
	var _x2 = x + _c * _x + _s * _y;
	var _y2 = y + _c * _y - _s * _x;
	draw_vertex(_x2, _y2);
}
draw_primitive_end();
