/// @description Insert description here
// You can write your code in this editor

draw_set_colour(color);
draw_set_alpha(1);
/*
draw_primitive_begin(pr_trianglestrip);
draw_vertex(x + lengthdir_x(8, direction + 90), y + lengthdir_y(8, direction + 90));
draw_vertex(x + lengthdir_x(64, direction), y + lengthdir_y(48, direction));
draw_vertex(x + lengthdir_x(8, direction - 90), y + lengthdir_y(8, direction - 90));
draw_primitive_end();

*/

if (dir != 5) {
	var _c = dcos(direction);
	var _s = dsin(direction);

	_x = 32;
	_y = 8;
	var _x1 = x + _c * _x + _s * _y;
	var _y1 = y + _c * _y - _s * _x;

	_y = -8;
	var _x2 = x + _c * _x + _s * _y;
	var _y2 = y + _c * _y - _s * _x;

	_x = 40;
	_y = 0;
	var _x3 = x + _c * _x + _s * _y;
	var _y3 = y + _c * _y - _s * _x;

	draw_primitive_begin(pr_trianglelist);
	draw_vertex(_x1,_y1);
	draw_vertex(_x2,_y2);
	draw_vertex(_x3,_y3);
	draw_primitive_end();
}

hrad = sprite_width / 2;
vrad = sprite_height / 2;

steps = 24;
draw_set_color(color);
draw_set_alpha(1);
//draw_primitive_begin(pr_trianglestrip);
//angle = 90;
//if (dir == 5)  angle = 0;
//for (i = -angle; i <= angle; i += 360 / steps) {
//	irad = 44;
//	orad = 48;
//	_xi = lengthdir_x(irad, i + direction);
//	_yi = lengthdir_y(irad, i + direction);
	
//	_xo = lengthdir_x(orad, i + direction);
//	_yo = lengthdir_y(orad, i + direction);

//	var _x1 = x + _xi;
//	var _y1 = y + _yi;
//	var _x2 = x + _xo;
//	var _y2 = y + _yo;

//	draw_vertex(_x1, _y1);
//	draw_vertex(_x2, _y2);
//}
//draw_primitive_end();

draw_primitive_begin(pr_trianglestrip);
//x11 = x+12;
//y11 =y-24;
//x12=x-12;
//y12=y+24;
//draw_vertex_colour(x11,y11,color,1);
for (i = 0; i < tlen; i+= 1) {
	tcnow = (i + tcounter + tlen) mod tlen;
	tcnext = (tcnow + 1) mod tlen;
	tdir = tcnext == tcounter ? point_direction(0,0,hsp,vsp-grav) : point_direction(tx[tcnow],ty[tcnow],tx[tcnext],ty[tcnext]);
	twid = 24;
	//talpha = clamp(2 * (i - tlen / 2) / (tlen / 2),0,1);
	talpha = clamp(2 * (i - 10) / 10,0,1);
	if (ammo <= 0) talpha *= 0.4;

	x1 = tx[tcnow];
	y1 = ty[tcnow];
	
	x11 = clamp(x1+lengthdir_x(twid,tdir+90),x1-12,x1+12);
	y11 = clamp(y1+lengthdir_y(twid,tdir+90),y1-24,y1+24);
	x12 = clamp(x1+lengthdir_x(twid,tdir-90),x1-12,x1+12);
	y12 = clamp(y1+lengthdir_y(twid,tdir-90),y1-24,y1+24);
	/*
	x11 = x1 - 2;
	y11 = y1 - 22;
	x12 = x1 + 2;
	y12 = y1 + 22;
	*/
	tcolor = color;

	if (global.hitstop > 0) talpha = i * 2 / tlen;

	draw_vertex_colour(x11, y11,tcolor,talpha);
	draw_vertex_colour(x12, y12,tcolor,talpha);
	
	//draw_vertex(x11, y11);
	//draw_vertex(x12, y12);
	//draw_circle(x11,y11,2,1);
	//draw_circle(x12,y12,2,1);

}
//draw_vertex_colour(x12-24,y12,color,0);
draw_primitive_end();

//tlast = (tcounter + 1 + tlen) mod tlen;
//draw_sprite_ext(spr_ptrail,image_index,tx[tlast],ty[tlast],image_xscale,image_yscale,0,color,1);

for (i = 1; i <= ammo; i++) {
	tcnow = (tlen - (i*2) + tcounter) mod tlen;

	x1 = tx[tcnow];
	y1 = ty[tcnow];
	
	draw_circle_color(x1,y1,7,color,color,0);
	draw_circle_color(x1,y1,6,c_white,c_white,0);
	// draw_text(x1,y1,i);
}

_s = spawning == spawntime ? (global.hitstop * global.hitstop) / 60 : 1;
_color = deaths == global.firstto ? c_black : color;

draw_sprite_ext(spr_ptrail,image_index,x,y,_s*image_xscale,_s*image_yscale,0,_color,1);
draw_self();
draw_sprite_ext(spr_ptrail,image_index,x,y,image_xscale,image_yscale,0,c_white,abs(dsin(360/30 * invul) * clamp(invul/60,0,1)));


//draw_primitive_begin(pr_trianglelist);
//draw_vertex(x, y-24);
//draw_vertex(x-8, y-32);
//draw_vertex(x+8, y-32);
//draw_primitive_end();

if (state != status.idle) {
	draw_rectangle(x,y-33,x+recovery,y-38,0);
	draw_rectangle(x,y-33,x-recovery,y-38,0);
}

draw_set_halign(fa_center);
draw_set_valign(fa_bottom);
draw_set_font(Font2);

draw_text(x, y-32, "(P" + teamstr + ")");



if (global.mode = gamemode.training) {
	draw_text(x-20, y-56, dir);
	
	draw_set_colour(c_white);
	if (global.down[gamepad][input.SL]) draw_set_colour($ff8000);
	draw_text(x-10, y-56, "A");

	draw_set_colour(c_white);
	if (global.down[gamepad][input.SH]) draw_set_colour($0099ff);
	draw_text(x-0, y-56, "B");

	draw_set_colour(c_white);
	if (global.down[gamepad][input.PA]) draw_set_colour(c_red);
	draw_text(x+10, y-56, "C");

	draw_set_colour(c_white);
	if (global.down[gamepad][input.JU]) draw_set_colour(c_lime);
	draw_text(x+20, y-56, "J");
}
