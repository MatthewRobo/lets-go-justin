/// @description Insert description here
// You can write your code in this editor

//if (global.paused) {
//	draw_set_alpha(0.4);
//	draw_set_color(c_black);
//	draw_rectangle(0,0,room_width,room_height,0);
//}

draw_set_font(Font1);
draw_set_valign(fa_top);

draw_set_alpha(1*!GREYBOX);

var width = display_get_gui_width();
var height= display_get_gui_height();

var xoffset = 8;
var yoffset = 16;
var iconsize = 48;
draw_set_color(global.fgcolor2);
//draw_sprite_stretched(global.shotsspr[0],0,xoffset,yoffset,iconsize,iconsize);
//draw_sprite_stretched(global.shotsspr[1],0,width-iconsize-xoffset,yoffset,iconsize,iconsize);

var pipgap = 4;
var centergap = 36;
var pipwidth = ((64*19/2 - centergap - 3) - pipgap * global.firstto) / global.firstto;
//var pipwidth = ((width/2 - centergap - 128 + 3) - pipgap * global.firstto) / global.firstto;
var pipslant = 24;

var piptotal = pipgap + pipwidth;

var pipoffset = 32;
var pipheight = 24;

var w11, w12, w21, h1, h2;
w11 = 16;
w12 = 2;
w21 = 8;

h1 = 7;
h2 = 4;
draw_set_color(global.outline);
draw_primitive_begin(pr_trianglestrip);
draw_vertex(width/2-centergap-global.firstto*piptotal-pipslant-w11,pipoffset-h1);
draw_vertex(width/2+centergap+global.firstto*piptotal+pipslant+w11,pipoffset-h1);
draw_vertex(width/2-centergap-global.firstto*piptotal-w12,pipoffset + pipheight + h1);
draw_vertex(width/2+centergap+global.firstto*piptotal+w12,pipoffset + pipheight + h1);
draw_primitive_end();

var offset = 3;

//draw_primitive_begin(pr_trianglestrip);
//draw_vertex(width/2-centergap-1-offset-24, 4+24);
//draw_vertex(width/2-centergap-1,    4-offset);
//draw_vertex(width/2-centergap-1,    4+offset+48);
//draw_vertex(width/2+centergap+1,    4-offset);
//draw_vertex(width/2+centergap+1,    4+offset+48);
//draw_vertex(width/2+centergap+1+offset+24, 4+24);
//draw_primitive_end();

draw_set_color(global.bgcolor);
draw_primitive_begin(pr_trianglestrip);
draw_vertex(width/2-centergap-global.firstto*piptotal-pipslant-w21,pipoffset - h2);
draw_vertex(width/2+centergap+global.firstto*piptotal+pipslant+w21,pipoffset - h2);
draw_vertex(width/2-centergap-global.firstto*piptotal,pipoffset + pipheight + h2);
draw_vertex(width/2+centergap+global.firstto*piptotal,pipoffset + pipheight + h2);
draw_primitive_end();

draw_set_color(global.outline);
draw_primitive_begin(pr_trianglestrip);
var e = 11;
var f = 0;
var g = 2 * f;
var h = 2;
draw_vertex(width/2-centergap-24-f+h, 4+24+f);
draw_vertex(width/2-centergap+h,  4);
draw_vertex(width/2-centergap+e-g+h,  4+e+48);
draw_vertex(width/2+centergap-h,  4);
draw_vertex(width/2+centergap-e+g-h,  4+e+48);
draw_vertex(width/2+centergap+24+f-h, 4+24+f);
draw_primitive_end();

if (global.pmax==4) {
	for (i = 0; i < (global.firstto - obj_player1.deaths - obj_player3.deaths); i++) {
		draw_set_colour(global.color[0]);
		drawpos = width / 2 - centergap - piptotal * i;
		//draw_rectangle(drawpos-pipwidth, pipoffset, drawpos, pipoffset + pipheight,0);

		draw_primitive_begin(pr_trianglestrip);
		draw_vertex(drawpos-pipwidth-pipslant, pipoffset);
		draw_vertex(drawpos-pipslant, pipoffset);
		draw_vertex(drawpos-pipwidth, pipoffset + pipheight);
		draw_vertex(drawpos, pipoffset + pipheight);
		draw_primitive_end();
		
		if (obj_player1.dead || obj_player3.dead) {
			draw_set_color(global.fgcolor2);
			drawpos = width / 2 - centergap - piptotal * (i + 1);
			var pipsum = sign(obj_player1.dead) + sign(obj_player3.dead);
			var deadmax = max(obj_player1.dead,obj_player3.dead);
			//draw_rectangle(drawpos-(pipsum*global.hitstop*pipwidth/deadmax), pipoffset, drawpos, pipoffset + pipheight,0);
			
			draw_primitive_begin(pr_trianglestrip);
			draw_vertex(drawpos-(pipsum*global.hitstop*pipwidth/deadmax)-pipslant, pipoffset);
			draw_vertex(drawpos-pipslant, pipoffset);
			draw_vertex(drawpos-(pipsum*global.hitstop*pipwidth/deadmax), pipoffset + pipheight);
			draw_vertex(drawpos, pipoffset + pipheight);
			draw_primitive_end();
		}
	}
	for (i = 0; i < (global.firstto - obj_player2.deaths - obj_player4.deaths); i++) {
		draw_set_colour(global.color[1]);
		drawpos = width / 2 + centergap + piptotal * i;
		//draw_rectangle(drawpos, pipoffset, drawpos+pipwidth, pipoffset + pipheight,0);
		
		draw_primitive_begin(pr_trianglestrip);
		draw_vertex(drawpos+pipwidth+pipslant, pipoffset);
		draw_vertex(drawpos+pipslant, pipoffset);
		draw_vertex(drawpos+pipwidth, pipoffset + pipheight);
		draw_vertex(drawpos, pipoffset + pipheight);
		draw_primitive_end();

		if (obj_player2.dead || obj_player4.dead) {
			draw_set_color(global.fgcolor2);
			drawpos = width / 2 + centergap + piptotal * (i + 1);
			var pipsum = sign(obj_player2.dead) + sign(obj_player4.dead);
			var deadmax = max(obj_player2.dead,obj_player4.dead);
			//draw_rectangle(drawpos, pipoffset, drawpos+(pipsum*global.hitstop*pipwidth/deadmax), pipoffset + pipheight,0);
			
			draw_primitive_begin(pr_trianglestrip);
			draw_vertex(drawpos+(pipsum*global.hitstop*pipwidth/deadmax)+pipslant, pipoffset);
			draw_vertex(drawpos+pipslant, pipoffset);
			draw_vertex(drawpos+(pipsum*global.hitstop*pipwidth/deadmax), pipoffset + pipheight);
			draw_vertex(drawpos, pipoffset + pipheight);
			draw_primitive_end();
		}
	}
} else {
	for (i = 0; i < (global.firstto - obj_player1.deaths); i++) {
		draw_set_colour(global.color[0]);
		drawpos = width / 2 - centergap - piptotal * i;
		//draw_rectangle(drawpos-pipwidth, pipoffset, drawpos, pipoffset + pipheight,0);
		draw_primitive_begin(pr_trianglestrip);
		draw_vertex(drawpos-pipwidth-pipslant, pipoffset);
		draw_vertex(drawpos-pipslant, pipoffset);
		draw_vertex(drawpos-pipwidth, pipoffset + pipheight);
		draw_vertex(drawpos, pipoffset + pipheight);
		draw_primitive_end();
		
		if (obj_player1.dead) {
			draw_set_color(global.fgcolor2);
			drawpos = width / 2 - centergap - piptotal * (i + 1);
			//draw_rectangle(drawpos-(global.hitstop*pipwidth/obj_player1.dead), pipoffset, drawpos, pipoffset + pipheight,0);
			draw_primitive_begin(pr_trianglestrip);
			draw_vertex(drawpos-(global.hitstop*pipwidth/obj_player1.dead)-pipslant, pipoffset);
			draw_vertex(drawpos-pipslant, pipoffset);
			draw_vertex(drawpos-(global.hitstop*pipwidth/obj_player1.dead), pipoffset + pipheight);
			draw_vertex(drawpos, pipoffset + pipheight);
			draw_primitive_end();
		}
	}
	for (i = 0; i < (global.firstto - obj_player2.deaths); i++) {
		draw_set_colour(global.color[1]);
		drawpos = width / 2 + centergap + piptotal * i;
		//draw_rectangle(drawpos, pipoffset, drawpos+pipwidth, pipoffset + pipheight,0);
		draw_primitive_begin(pr_trianglestrip);
		draw_vertex(drawpos+pipwidth+pipslant, pipoffset);
		draw_vertex(drawpos+pipslant, pipoffset);
		draw_vertex(drawpos+pipwidth, pipoffset + pipheight);
		draw_vertex(drawpos, pipoffset + pipheight);
		draw_primitive_end();
		
		if (obj_player2.dead) {
			draw_set_color(global.fgcolor2);
			drawpos = width / 2 + centergap + piptotal * (i + 1);
			//draw_rectangle(drawpos, pipoffset, drawpos+(global.hitstop*pipwidth/obj_player2.dead), pipoffset + pipheight,0);
			draw_primitive_begin(pr_trianglestrip);
			draw_vertex(drawpos+(global.hitstop*pipwidth/obj_player2.dead)+pipslant, pipoffset);
			draw_vertex(drawpos+pipslant, pipoffset);
			draw_vertex(drawpos+(global.hitstop*pipwidth/obj_player2.dead), pipoffset + pipheight);
			draw_vertex(drawpos, pipoffset + pipheight);
			draw_primitive_end();
		}
	}
}


draw_set_colour(global.bgcolor);
draw_set_valign(fa_bottom);
var text = string_replace_all(string_format(sremain, 2, 0), " ", "0");
var textdiff = string_width(text);
draw_set_font(fnt_prompt);
var text = "."+string_replace_all(string_format(msremain, 2, 0), " ", "0");
textdiff -= string_width(text);
draw_set_font(Font1);
draw_set_halign(fa_right);
var text = string_replace_all(string_format(sremain, 2, 0), " ", "0");
draw_text(width/2+textdiff/2+1,64,text);
draw_set_halign(fa_left);
draw_set_font(fnt_prompt);
var text = "."+string_replace_all(string_format(msremain, 2, 0), " ", "0");
draw_text(width/2+textdiff/2-1,56,text);

//draw_rectangle(width/2-1, 4, width/2+1, 59,0);

draw_set_colour(global.fgcolor2);
draw_set_font(fnt_smallsemi);
draw_set_valign(fa_bottom);
//draw_rectangle(width/2-1, 768-64, width/2+1, 768,0);
draw_set_halign(fa_right);


var _x1 = lerp(-pi,pi,restart);
var _x2 = lerp(-pi,pi,quit);
var _e = 2.718281828459;
var mult = 1.01;
var _ans1 = (power(_e, 2*_x1)-1)/(power(_e, 2*_x1)+1);
_ans1 = clamp((_ans1*mult + 1) / 2,0,1);
var _ans2 = (power(_e, 2*_x2)-1)/(power(_e, 2*_x2)+1);
_ans2 = clamp((_ans2*mult + 1) / 2,0,1);
//draw_rectangle(0, height - 16, 0.5*(dsin(timer * 180 + 270)+1) * width, height,0);

//draw_rectangle(width/2, height - 3,-_ans1*width/2+width/2, height,0);
//draw_rectangle(width/2, height - 3, _ans2*width/2+width/2, height,0);

draw_set_font(fnt_prompt);

var prompt1 = global.mode == gamemode.training ? "Select to restart" : "Hold Select to restart";
var prompt2 = global.mode == gamemode.training ? "Start to pause" : "Hold Start to pause";
var line_height = string_height(prompt1);

var centergap = 3;
var gap = 3;
var hoffset1 = -_ans1*width/2;
var hoffset2 = _ans2*width/2;
draw_rectangle(-centergap + hoffset1 + width/2-string_width(prompt1)-gap*2,height-line_height-gap,-centergap + width/2,height,0);
draw_rectangle(centergap + width/2,
height-line_height-gap,
centergap + hoffset2 + width/2+string_width(prompt2)+gap*2,
height,0);

var xoffset = 3;
var xmargin = 3;
var ymargin = -4;

draw_rectangle(
xoffset-xmargin,
0,
xoffset+xmargin+string_width(global.shotsstr[0]),
ymargin+line_height,0);

draw_rectangle(
width-xoffset-xmargin-string_width(global.shotsstr[1]),
0,
width-xoffset+xmargin,
ymargin+line_height,0);

draw_set_color(global.fgcolor);
draw_text(-centergap + hoffset1 + width / 2-gap,height,prompt1);
draw_text(width-xoffset,line_height+2,global.shotsstr[1]);

draw_set_halign(fa_left);
draw_text(centergap + hoffset2 + width / 2+gap,height,prompt2);
draw_text(xoffset,line_height+2,global.shotsstr[0]);

if (roundstart > 0 && roundfreeze <= 0) {
	draw_set_font(fnt_win);
	var ready = "Ready?";
	var _xdraw = width/2 + 118*dtan(lerp(-80,80,roundratio));
	var _ydraw1 = height/2-string_height(ready);
	var _ydraw2 = height/2
	draw_set_halign(fa_center);
	draw_set_color(global.fgcolor2);
	draw_rectangle(_xdraw-string_width(ready)/2-10,_ydraw1,
	               _xdraw+string_width(ready)/2+10,_ydraw2,0);
	//draw_rectangle(width/2- 118*dtan(lerp(80,0,roundratio)), 388, width/2+118*dtan(lerp(80,0,roundratio)), 392,0);
	draw_set_color(global.bgcolor);
	draw_text(_xdraw, height/2, "Ready?");
	draw_set_color(c_black);
	draw_set_alpha(min(0.5,(roundinit-roundstart)*0.5/10));
	var _roundratio = power(roundratio,4);
	draw_rectangle(0,0,width,lerp(_ydraw1,0,_roundratio),0);
	draw_rectangle(0,lerp(_ydraw2,height,_roundratio),width,height,0);
	draw_set_alpha(1);
}



//draw_rectangle(width/2, 768-3, width/2 - 2 * restart, 768,0);
//draw_rectangle(width/2, 768-3, width/2 + 2 * quit, 768,0);


//draw_rectangle(width/2, 768-4, width/2 - 2 * restart, 768-8,0);
//draw_rectangle(width/2, 768-4, width/2 + 2 * quit, 768-8,0);

draw_set_valign(fa_middle);
draw_set_font(fnt_win);
if (global.pmax == 4) {
	if (obj_player1.deaths + obj_player3.deaths == global.firstto) 
	|| (obj_player1.deaths + obj_player3.deaths == global.firstto + 1) {
		draw_set_colour(global.color[1]);
		draw_set_halign(fa_center);
		draw_text(width/2, height/2, "TEAM COOL\nWINS");
	}

	if (obj_player2.deaths + obj_player4.deaths == global.firstto) 
	|| (obj_player2.deaths + obj_player4.deaths == global.firstto + 1) {
		draw_set_colour(global.color[0]);
		draw_set_halign(fa_center);
		draw_text(width/2, height/2, "TEAM HOT\nWINS");
	}
} else {
	if (obj_player1.deaths == global.firstto) {
		draw_set_colour(global.color[1]);
		draw_set_halign(fa_center);
		draw_text(width/2, height/2, "PLAYER 2\nWINS");
	}
	if (obj_player2.deaths == global.firstto) {
		draw_set_colour(global.color[0]);
		draw_set_halign(fa_center);
		draw_text(width/2, height/2, "PLAYER 1\nWINS");
	}
}


if global.takess {
	if (GREYBOX) screen_save("spr_" + room_get_name(room)+"Prev.png");
	
	else {
		if !directory_exists("gamewinners")
		{
		    directory_create("gamewinners");
		}
		screen_save("gamewinners\\"+string(unix_timestamp())+ ".png");
	}
	global.takess = false;
}
