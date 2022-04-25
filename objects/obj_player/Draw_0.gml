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
if !GREYBOX {
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

draw_primitive_begin(pr_trianglestrip);
for (i = 0; i < tlen; i+= 1) {
	tcnow = (i + tcounter + tlen) mod tlen;
	tcnext = (tcnow + 1) mod tlen;
	tdir = tcnext == tcounter ? point_direction(0,0,hsp,vsp-grav) : point_direction(tx[tcnow],ty[tcnow],tx[tcnext],ty[tcnext]);
	twid = 24;
	//talpha = clamp(2 * (i - tlen / 2) / (tlen / 2),0,1);
	talpha = clamp(2 * (i - 10) / 10,0,1);
	if (ammo <= 0) talpha *= 0.4;

	x1 = tx[tcnow];
	y1 = ty[tcnow] - 2*dsin(lifetime - 6 * (tlen - i ));
	
	x11 = clamp(x1+lengthdir_x(twid,tdir+90),x1-8,x1+8);
	y11 = clamp(y1+lengthdir_y(twid,tdir+90),y1-18,y1+18);
	x12 = clamp(x1+lengthdir_x(twid,tdir-90),x1-8,x1+8);
	y12 = clamp(y1+lengthdir_y(twid,tdir-90),y1-18,y1+18);

	tcolor = color;

	if (global.hitstop > 0) talpha = i * 2 / tlen;

	draw_vertex_colour(x11, y11,tcolor,talpha);
	draw_vertex_colour(x12, y12,tcolor,talpha);
}
draw_primitive_end();

for (i = ammo; i > 0; i--) {
	tcnow = (tlen - (i*2) + tcounter) mod tlen;

	x1 = tx[tcnow];
	y1 = ty[tcnow];
	
	draw_circle_color(x1,y1,8,c_black,global.bgcolor,0);
	draw_circle_color(x1,y1,6,c_white,c_white,0);
}

_s = spawning == spawntime ? (global.hitstop * global.hitstop) / 60 : 1;
_color = deaths == global.firstto ? c_black : color;
_i = abs(dsin(360/30 * invul))*0.2 + 1;
var _x = floor(x+0.5);
var _ysin = floor(y + 2 * -dsin(lifetime)+0.5);
image_index = 0;


draw_sprite_ext(spr_ptrail,image_index,_x,_ysin,_i*image_xscale,_i*image_yscale,0,c_white,1);
draw_sprite_ext(spr_ptrail,image_index,_x,_ysin,_s*image_xscale,_s*image_yscale,0,_color,1);

// SPRITE ASSEMBLY
draw_sprite_ext(spr_pborder,image_index,_x,_ysin,image_xscale,image_yscale,0,c_white,1);
eyecolor = ammo <= 0 ? $3326A2 : $EDF7FD;
if (state == status.parry) eyecolor = $DB9900;
draw_sprite_ext(spr_peyes,image_index,_x,_ysin+vvec,image_xscale,image_yscale,0,eyecolor,1);
draw_sprite_ext(spr_idle,image_index,_x,_ysin,image_xscale,image_yscale,0,image_blend,1);
// ---
if (state == status.recovery) {
	draw_sprite_ext(spr_poverlay,0,_x,_ysin,image_xscale,image_yscale,0,c_red,0.35);
} else if (state == status.parried) {
	draw_sprite_ext(spr_poverlay,0,_x,_ysin,image_xscale,image_yscale,0,c_aqua,0.35);
}
draw_sprite_ext(spr_pparry,image_index,_x,_ysin,image_xscale,image_yscale,0,c_white,abs(dcos(360/30 * invul) * clamp(invul/60,0,1)));
if (state == status.parry) {
	_s = (abs(dsin(recovery * 20)) + 1) / 2;
	draw_sprite_ext(spr_pparry,image_index,_x,_ysin,image_xscale,image_yscale,0,c_white,_s);
}
if (flash) {
	draw_sprite_ext(spr_poverlay,image_index,_x,_ysin,image_xscale,image_yscale,0,color,1);
	flash = false;
}

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
} else {
	draw_set_color(color);
	draw_rectangle(bbox_left,bbox_top,bbox_right,bbox_bottom,0);
}
