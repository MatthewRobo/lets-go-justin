#macro AUTOCOLOR true

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

<<<<<<< Updated upstream
draw_primitive_begin(pr_linestrip);
for (i = tcounter - 1; i >= 0; i--) {
	x1 = tx[i];
	y1 = ty[i];
	draw_vertex(x1,y1);
=======
var seam,next,x1,x2,y1,y2,angle,dx,dy,twidth,tflip;
tflip = tcounter mod 2 ? 0 : 180;
twidth = 24;
draw_primitive_begin(pr_trianglestrip);
for (i = 1; i <= tlen; i++) {
	seam = (tcounter - i + tlen) mod tlen;
	next = (seam - 1 + tlen) mod tlen;
	x1 = tx[seam];
	y1 = ty[seam];
	x2 = tx[next];
	y2 = ty[next];
	angle = seam == tcounter ? angle : point_direction(x1,y1,x2,y2);
	dx = lengthdir_x(twidth,angle+90+tflip);
	dy = lengthdir_y(twidth,angle+90+tflip);
	if (i == 1) {
		draw_vertex_color(x1-dx,y1-dy,color,(tlen-i)/tlen);
	}

	draw_vertex_color(x1+dx,y1+dy,color,(tlen-i)/tlen);
	tflip += 180;
	//draw_vertex(x1-dx,y1-dy);
>>>>>>> Stashed changes
}
for (i = tlen - 1; i >= tcounter; i--) {
	x1 = tx[i];
	y1 = ty[i];
	draw_vertex(x1,y1);
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
if (teammate != noone) {
	_color = deaths + teammate.deaths == global.firstto ? c_black : color;
} else {
	_color = deaths == global.firstto ? c_black : color;
}

_i = abs(dsin(360/30 * invul))*0.2 + 1;
var _x = floor(x+0.5);
var _ysin = floor(y + 2 * -dsin(lifetime)+0.5);
image_index = 0;

var yscale = grounded ? image_yscale : image_yscale * lerp(0.9,1.2,abs(vsp / 13));
yscale *= hjiggle;

_ysin += ((1 - hjiggle) * 48 * jiggledir)/2;

var xscale = sign(image_xscale);
xscale *= wjiggle;

draw_sprite_ext(spr_ptrail,image_index,_x,_ysin,_i*xscale,_i*yscale,0,c_white,1);
draw_sprite_ext(spr_ptrail,image_index,_x,_ysin,_s*xscale,_s*yscale,0,_color,1);



// SPRITE ASSEMBLY

eyecolor = ammo <= 0 ? $3326A2 : $EDF7FD;
if (state == status.parry) eyecolor = $DB9900;

draw_sprite_ext(spr_pborder,image_index,_x,_ysin,xscale,yscale,0,c_white,1);
draw_sprite_ext(spr_peyes,image_index,_x,_ysin+vvec,xscale,yscale,0,eyecolor,1);


if (AUTOCOLOR) {
	draw_sprite_ext(spr_probes,image_index,_x,_ysin,xscale,yscale,0,color,1);
	draw_sprite_ext(spr_probes,image_index,_x,_ysin,xscale,yscale,0,c_black,0.6);
	draw_sprite_ext(spr_ptrim,image_index,_x,_ysin,xscale,yscale,0,color,1);
} else {
	draw_sprite_ext(spr_idle,image_index,_x,_ysin,xscale,yscale,0,image_blend,1);
}

// ---
switch state {
	case status.recovery: draw_sprite_ext(spr_poverlay,0,_x,_ysin,xscale,yscale,0,c_red,0.35); break;
	case status.parried:  draw_sprite_ext(spr_poverlay,0,_x,_ysin,xscale,yscale,0,c_aqua,0.35); break;
	case status.stun:     draw_sprite_ext(spr_poverlay,0,_x,_ysin,xscale,yscale,0,c_white,0.35); break;
}

draw_sprite_ext(spr_pparry,image_index,_x,_ysin,xscale,yscale,0,c_white,abs(dcos(360/30 * invul) * clamp(invul/60,0,1)));
if (state == status.parry) {
	_s = (abs(dsin(recovery * 20)) + 1) / 2;
	draw_sprite_ext(spr_pparry,image_index,_x,_ysin,xscale,yscale,0,c_white,_s);
}
if (flash) {
	draw_sprite_ext(spr_poverlay,image_index,_x,_ysin,xscale,yscale,0,c_white,1);
	flash = false;
}

if (state != status.idle) {
	draw_rectangle(x,y-33,x+recovery,y-38,0);
	draw_rectangle(x,y-33,x-recovery,y-38,0);
}
draw_set_color(c_white);
if (state == status.stun) {
	draw_rectangle(x,y-39,x+stun,y-44,0);
	draw_rectangle(x,y-39,x-stun,y-44,0);
}
draw_set_color(color);

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
