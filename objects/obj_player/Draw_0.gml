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

if (roundstart > 0 && roundfreeze > 0) {
	draw_set_color(color);
	var _angle = recovery * recovery * 0.3;
	var _dist = recovery*8;
	for (i = 0; i < 360; i += 360 / 6) {
		var _a = _angle + i;
		draw_circle(x+lengthdir_x(_dist,_a)*sign(image_xscale),y+lengthdir_y(_dist,_a),24-recovery/4,0);
	}
}
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

var _x = floor(x+0.5);
var _ysin = floor(y + 2 * -dsin(lifetime)+0.5);
image_index = 0;

var yscale = grounded ? image_yscale : image_yscale * lerp(0.9,1.2,abs(vsp / 13));
yscale *= hjiggle;

var dy = ((1 - hjiggle) * 48 * jiggledir)/2;
_ysin += dy;

var xscale = sign(image_xscale);
xscale *= wjiggle;

steps = 24;
draw_set_color(color);
draw_set_alpha(1);

if (team >= 2) {
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
		y1 = ty[tcnow];
		//y1 = ty[tcnow] - 2*dsin(lifetime - 6 * (tlen - i ));
	
		x11 = clamp(x1+lengthdir_x(twid,tdir+90),x1-6,x1+6);
		y11 = clamp(y1+lengthdir_y(twid,tdir+90),y1-16,y1+16);
		x12 = clamp(x1+lengthdir_x(twid,tdir-90),x1-6,x1+6);
		y12 = clamp(y1+lengthdir_y(twid,tdir-90),y1-16,y1+16);

		tcolor = global.textcolor;

		if (global.hitstop > 0) talpha = i * 2 / tlen;

		draw_vertex_colour(x11, y11,tcolor,talpha);
		draw_vertex_colour(x12, y12,tcolor,talpha);
	}
	draw_primitive_end();
}
draw_primitive_begin(pr_trianglestrip);
for (i = 0; i < tlen; i+= 1) {
	tcnow = (i + tcounter + tlen) mod tlen;
	tcnext = (tcnow + 1) mod tlen;
	tdir = tcnext == tcounter ? point_direction(0,0,hsp,vsp-grav) : point_direction(tx[tcnow],ty[tcnow],tx[tcnext],ty[tcnext]);
	twid = team >= 2 ? 12 : 32;
	//talpha = clamp(2 * (i - tlen / 2) / (tlen / 2),0,1);
	talpha = clamp(2*i/tlen,0,1);
	if (ammo <= 0) talpha *= 0.4;

	x1 = tx[tcnow];
	y1 = ty[tcnow];
	//y1 += 2*dsin(i * 20 + lifetime2 * 10);
	//twid *= i/tlen;
	//y1 = ty[tcnow] - 2*dsin(lifetime - 6 * (tlen - i ));
	

	var xwid = 10
	var ywid = 16;
	var _scale;
	//_scale = max(1,1.5 - (i/tlen));
	_scale = (1-(i/tlen)) * 0.2;
	_scale++;
	xwid *= _scale;
	ywid *= _scale;
	x11 = clamp(x1+lengthdir_x(twid,tdir+90),x1-xwid,x1+xwid);
	y11 = clamp(y1+lengthdir_y(twid,tdir+90),y1-ywid,y1+ywid);
	x12 = clamp(x1+lengthdir_x(twid,tdir-90),x1-xwid,x1+xwid);
	y12 = clamp(y1+lengthdir_y(twid,tdir-90),y1-ywid,y1+ywid);
	//x11 = clamp(x1+lengthdir_x(twid,tdir+90),x1-xwid,x1+xwid);
	//y11 = clamp(y1+lengthdir_y(twid,tdir+90),y1-ywid,y1+ywid);
	//x12 = clamp(x1+lengthdir_x(twid,tdir-90),x1-xwid,x1+xwid);
	//y12 = clamp(y1+lengthdir_y(twid,tdir-90),y1-ywid,y1+ywid);

	tcolor = color;

	if (global.hitstop > 0) talpha*=2;
	if (global.hitstop > 0) talpha=1;

	draw_vertex_colour(x11, y11,tcolor,talpha);
	draw_vertex_colour(x12, y12,tcolor,talpha);
}
draw_primitive_end();


for (i = 1; i <= ammo; i += 1) {
	j = 2 * i;
	draw_primitive_begin(pr_trianglestrip);
	tcnow = (tlen + tcounter - j) mod tlen;
	tcnext = (tcnow + tlen - 1) mod tlen;
	tdir = tcnext == tcounter ? point_direction(0,0,hsp,vsp-grav) : point_direction(tx[tcnow],ty[tcnow],tx[tcnext],ty[tcnext]);
	twid = 6;

	x1 = tx[tcnow];
	y1 = ty[tcnow] - 2 * dsin(lifetime - 6 * j);
	x2 = tx[tcnext];
	y2 = ty[tcnext]- 2 * dsin(lifetime - 6 * (j + 1));
	
	x11 = clamp(x1+lengthdir_x(twid,tdir+90),x1-8,x1+8);
	y11 = clamp(y1+lengthdir_y(twid,tdir+90),y1-18,y1+18);
	x12 = clamp(x1+lengthdir_x(twid,tdir-90),x1-8,x1+8);
	y12 = clamp(y1+lengthdir_y(twid,tdir-90),y1-18,y1+18);

	x21 = clamp(x2+lengthdir_x(twid,tdir+90),x2-8,x2+8);
	y21 = clamp(y2+lengthdir_y(twid,tdir+90),y2-18,y2+18);
	x22 = clamp(x2+lengthdir_x(twid,tdir-90),x2-8,x2+8);
	y22 = clamp(y2+lengthdir_y(twid,tdir-90),y2-18,y2+18);
	tcolor = global.textcolor;

	draw_vertex_colour(x11, y11,tcolor,1);
	draw_vertex_colour(x12, y12,tcolor,1);
	draw_vertex_colour(x21, y21,tcolor,1);
	draw_vertex_colour(x22, y22,tcolor,1);
	draw_primitive_end();
}

//for (i = ammo; i > 0; i--) {
//	tcnow = (tlen - (i*2) + tcounter) mod tlen;

//	x1 = tx[tcnow];
//	y1 = ty[tcnow];
	
//	draw_set_alpha(0.5);
//	draw_circle_color(x1,y1,8,global.bgcolor,global.bgcolor,0);
//	draw_set_alpha(1);
//	draw_circle_color(x1,y1,6,global.textcolor,global.textcolor,0);
//}

var _s = outlinescale;
if (global.takess) _s = 1;

if (teammate != noone) {
	_color = deaths + teammate.deaths == global.firstto ? c_black : color;
} else {
	_color = deaths == global.firstto ? c_black : color;
}

_i = abs(dsin(360/30 * invul))*0.2 + 1;

if (roundfreeze <= 0) {

draw_sprite_ext(spr_ptrail,image_index,_x,_ysin,_i*xscale,_i*yscale,0,c_white,1);
draw_sprite_ext(spr_ptrail,image_index,_x,_ysin,_s*xscale,_s*yscale,0,_color,1);

// SPRITE ASSEMBLY

eyecolor = ammo <= 0 ? $3326A2 : $EDF7FD;
if (state == status.parry) {
	eyecolor = $DB9900;
	var _scale = 1.1;
	//var _scale2 = max(_scale, 1+abs(recovery-parryactive) * 0.1);
	var _scale2 = lerp(1.1,1.5,abs(dsin(recovery * 40)+1)/2);
	//draw_set_alpha(abs(dsin(40 * recovery))*0.6);
	//draw_set_color(c_aqua);
	//draw_circle(x,_ysin,36,0);
	
	draw_sprite_ext(spr_ptrail,image_index,_x,_ysin,xscale*_scale2,yscale*_scale2,0,$ffff60,1);
	draw_sprite_ext(spr_pborder,image_index,_x,_ysin,xscale*_scale,yscale*_scale,0,c_white,1);

	//draw_set_alpha(1);
}

var invulflash = max(0,invul mod 10 >= 5);
draw_sprite_ext(spr_pborder,invulflash,_x,_ysin,xscale,yscale,0,c_white,1);
draw_sprite_ext(spr_peyes,image_index,_x,_ysin+vvec,xscale,yscale,0,eyecolor,1);



if (AUTOCOLOR) {

	if (team >= 2) {
		draw_sprite_ext(spr_probes,image_index,_x,_ysin,xscale,yscale,0,color,1);
		draw_sprite_ext(spr_ptrim,image_index,_x,_ysin,xscale,yscale,0,c_white,1);
	} else {
		draw_sprite_ext(spr_probes,image_index,_x,_ysin,xscale,yscale,0,color,0.6);
		draw_sprite_ext(spr_ptrim,image_index,_x,_ysin,xscale,yscale,0,color,1);
	}

} else {
	draw_sprite_ext(spr_idle,image_index,_x,_ysin,xscale,yscale,0,image_blend,1);
}

// ---
switch state {
	case status.recovery: draw_sprite_ext(spr_poverlay,0,_x,_ysin,xscale,yscale,0,c_red,0.35); break;
	case status.parried:  draw_sprite_ext(spr_poverlay,0,_x,_ysin,xscale,yscale,0,c_aqua,0.35); break;
	case status.stun:     draw_sprite_ext(spr_poverlay,0,_x,_ysin,xscale,yscale,0,c_white,0.35); break;
}

//draw_sprite_ext(spr_pparry,image_index,_x,_ysin,xscale,yscale,0,global.textcolor,abs(dcos(360/30 * invul) * clamp(invul/60,0,1)));
if (state == status.parry) {
	_s = (abs(dsin(recovery * 20)) + 1) / 2;
	draw_sprite_ext(spr_probes,image_index,_x,_ysin,xscale,yscale,0,c_white,_s);
}

draw_sprite_ext(spr_poverlay,image_index,_x,_ysin,xscale,yscale,0,c_white,flash);
}

if (state != status.idle) {
	draw_rectangle(x,y-33,x+recovery,y-38,0);
	draw_rectangle(x,y-33,x-recovery,y-38,0);
}
draw_set_color(global.textcolor);
if (state == status.stun) {
	draw_rectangle(x,y-39,x+stun,y-44,0);
	draw_rectangle(x,y-39,x-stun,y-44,0);
}
draw_set_color(color);


draw_set_halign(fa_center);
draw_set_valign(fa_bottom);
draw_set_font(fnt_large);

draw_text_transformed(x, y-32, "[P" + teamstr + "]",textscale,textscale,0);
draw_set_color(global.textcolor);
draw_set_alpha(spawning/spawntime);
draw_text_transformed(x, y-32, "[P" + teamstr + "]",textscale,textscale,0);
draw_set_alpha(1);
draw_set_color(color);
draw_set_font(fnt_buttons);

if (global.mode = gamemode.training) {
	draw_text(x-20, y-56, dir);
	
	draw_set_colour(global.textcolor);
	if (global.down[gamepad][input.SL]) draw_set_colour($ff8000);
	draw_text(x-10, y-56, "A");

	draw_set_colour(global.textcolor);
	if (global.down[gamepad][input.SH]) draw_set_colour($0099ff);
	draw_text(x-0, y-56, "B");

	draw_set_colour(global.textcolor);
	if (global.down[gamepad][input.PA]) draw_set_colour(c_red);
	draw_text(x+10, y-56, "C");

	draw_set_colour(global.textcolor);
	if (global.down[gamepad][input.JU]) draw_set_colour(c_lime);
	draw_text(x+20, y-56, "J");
}

draw_set_color(global.textcolor);
draw_set_alpha(abs(dcos(360/30 * invul) * clamp(invul/60,0,1))*0.6);
draw_circle(x,_ysin,36,0);

} else {
	draw_set_color(color);
	draw_rectangle(bbox_left,bbox_top,bbox_right,bbox_bottom,0);
}


