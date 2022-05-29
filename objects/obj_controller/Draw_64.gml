/// @description Insert description here
// You can write your code in this editor

draw_set_font(Font1);
draw_set_valign(fa_top);

draw_set_alpha(1*!GREYBOX);

var width = camera_get_view_width(0);
var height= camera_get_view_height(0);

var pipgap = 4;
var centergap = 48;
var pipwidth = ((room_width/2 - centergap - 128 + 3) - pipgap * global.firstto) / global.firstto;
var pipslant = 24;

var piptotal = pipgap + pipwidth;

draw_set_color(global.outline);
draw_primitive_begin(pr_trianglestrip);
draw_vertex(width/2-centergap-global.firstto*piptotal-pipslant-10,1);
draw_vertex(width/2+centergap+global.firstto*piptotal+pipslant+10,1);
draw_vertex(width/2-centergap-global.firstto*piptotal-3,63);
draw_vertex(width/2+centergap+global.firstto*piptotal+3,63);
draw_primitive_end();
draw_set_color(global.bgcolor);
draw_primitive_begin(pr_trianglestrip);
draw_vertex(width/2-centergap-global.firstto*piptotal-pipslant-4,4);
draw_vertex(width/2+centergap+global.firstto*piptotal+pipslant+4,4);
draw_vertex(width/2-centergap-global.firstto*piptotal,60);
draw_vertex(width/2+centergap+global.firstto*piptotal,60);
draw_primitive_end();

if (global.pmax==4) {
	for (i = 0; i < (global.firstto - obj_player1.deaths - obj_player3.deaths); i++) {
		draw_set_colour(global.color[0]);
		drawpos = width / 2 - centergap - piptotal * i;
		//draw_rectangle(drawpos-pipwidth, 8, drawpos, 56,0);

		draw_primitive_begin(pr_trianglestrip);
		draw_vertex(drawpos-pipwidth-pipslant, 8);
		draw_vertex(drawpos-pipslant, 8);
		draw_vertex(drawpos-pipwidth, 56);
		draw_vertex(drawpos, 56);
		draw_primitive_end();
		
		if (obj_player1.dead || obj_player3.dead) {
			draw_set_color(global.fgcolor2);
			drawpos = width / 2 - centergap - piptotal * (i + 1);
			var pipsum = sign(obj_player1.dead) + sign(obj_player3.dead);
			var deadmax = max(obj_player1.dead,obj_player3.dead);
			//draw_rectangle(drawpos-(pipsum*global.hitstop*pipwidth/deadmax), 8, drawpos, 56,0);
			
			draw_primitive_begin(pr_trianglestrip);
			draw_vertex(drawpos-(pipsum*global.hitstop*pipwidth/deadmax)-pipslant, 8);
			draw_vertex(drawpos-pipslant, 8);
			draw_vertex(drawpos-(pipsum*global.hitstop*pipwidth/deadmax), 56);
			draw_vertex(drawpos, 56);
			draw_primitive_end();
		}
	}
	for (i = 0; i < (global.firstto - obj_player2.deaths - obj_player4.deaths); i++) {
		draw_set_colour(global.color[1]);
		drawpos = width / 2 + centergap + piptotal * i;
		//draw_rectangle(drawpos, 8, drawpos+pipwidth, 56,0);
		
		draw_primitive_begin(pr_trianglestrip);
		draw_vertex(drawpos+pipwidth+pipslant, 8);
		draw_vertex(drawpos+pipslant, 8);
		draw_vertex(drawpos+pipwidth, 56);
		draw_vertex(drawpos, 56);
		draw_primitive_end();

		if (obj_player2.dead || obj_player4.dead) {
			draw_set_color(global.fgcolor2);
			drawpos = width / 2 + centergap + piptotal * (i + 1);
			var pipsum = sign(obj_player2.dead) + sign(obj_player4.dead);
			var deadmax = max(obj_player2.dead,obj_player4.dead);
			//draw_rectangle(drawpos, 8, drawpos+(pipsum*global.hitstop*pipwidth/deadmax), 56,0);
			
			draw_primitive_begin(pr_trianglestrip);
			draw_vertex(drawpos+(pipsum*global.hitstop*pipwidth/deadmax)+pipslant, 8);
			draw_vertex(drawpos+pipslant, 8);
			draw_vertex(drawpos+(pipsum*global.hitstop*pipwidth/deadmax), 56);
			draw_vertex(drawpos, 56);
			draw_primitive_end();
		}
	}
} else {
	for (i = 0; i < (global.firstto - obj_player1.deaths); i++) {
		draw_set_colour(global.color[0]);
		drawpos = width / 2 - centergap - piptotal * i;
		//draw_rectangle(drawpos-pipwidth, 8, drawpos, 56,0);
		draw_primitive_begin(pr_trianglestrip);
		draw_vertex(drawpos-pipwidth-pipslant, 8);
		draw_vertex(drawpos-pipslant, 8);
		draw_vertex(drawpos-pipwidth, 56);
		draw_vertex(drawpos, 56);
		draw_primitive_end();
		
		if (obj_player1.dead) {
			draw_set_color(global.fgcolor2);
			drawpos = width / 2 - centergap - piptotal * (i + 1);
			//draw_rectangle(drawpos-(global.hitstop*pipwidth/obj_player1.dead), 8, drawpos, 56,0);
			draw_primitive_begin(pr_trianglestrip);
			draw_vertex(drawpos-(global.hitstop*pipwidth/obj_player1.dead)-pipslant, 8);
			draw_vertex(drawpos-pipslant, 8);
			draw_vertex(drawpos-(global.hitstop*pipwidth/obj_player1.dead), 56);
			draw_vertex(drawpos, 56);
			draw_primitive_end();
		}
	}
	for (i = 0; i < (global.firstto - obj_player2.deaths); i++) {
		draw_set_colour(global.color[1]);
		drawpos = width / 2 + centergap + piptotal * i;
		//draw_rectangle(drawpos, 8, drawpos+pipwidth, 56,0);
		draw_primitive_begin(pr_trianglestrip);
		draw_vertex(drawpos+pipwidth+pipslant, 8);
		draw_vertex(drawpos+pipslant, 8);
		draw_vertex(drawpos+pipwidth, 56);
		draw_vertex(drawpos, 56);
		draw_primitive_end();
		
		if (obj_player2.dead) {
			draw_set_color(global.fgcolor2);
			drawpos = width / 2 + centergap + piptotal * (i + 1);
			//draw_rectangle(drawpos, 8, drawpos+(global.hitstop*pipwidth/obj_player2.dead), 56,0);
			draw_primitive_begin(pr_trianglestrip);
			draw_vertex(drawpos+(global.hitstop*pipwidth/obj_player2.dead)+pipslant, 8);
			draw_vertex(drawpos+pipslant, 8);
			draw_vertex(drawpos+(global.hitstop*pipwidth/obj_player2.dead), 56);
			draw_vertex(drawpos, 56);
			draw_primitive_end();
		}
	}
}


draw_set_colour(global.fgcolor2);

draw_set_valign(fa_bottom);
var text = string_replace_all(string_format(seconds, 2, 0), " ", "0");
var textdiff = string_width(text);
draw_set_font(fnt_prompt);
var text = "."+string_replace_all(string_format(ms, 2, 0), " ", "0");
textdiff -= string_width(text);
draw_set_font(Font1);
draw_set_halign(fa_right);
var text = string_replace_all(string_format(seconds, 2, 0), " ", "0");
draw_text(width/2+textdiff/2+1,64,text);
draw_set_halign(fa_left);
draw_set_font(fnt_prompt);
var text = "."+string_replace_all(string_format(ms, 2, 0), " ", "0");
draw_text(width/2+textdiff/2-1,56,text);

//draw_rectangle(width/2-1, 4, width/2+1, 59,0);

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
var prompt2 = "Hold Start to quit";

var centergap = 3;
var gap = 3;
var hoffset1 = -_ans1*width/2;
var hoffset2 = _ans2*width/2;
draw_rectangle(-centergap + hoffset1 + width/2-string_width(prompt1)-gap*2,height-string_height(prompt1)-gap,-centergap + width/2,height,0);
draw_rectangle(centergap + width/2,height-string_height(prompt2)-gap, centergap + hoffset2 + width/2+string_width(prompt2)+gap*2,height,0);

draw_set_color(global.fgcolor);
draw_text(-centergap + hoffset1 + width / 2-gap,height,prompt1);

draw_set_halign(fa_left);
draw_text(centergap + hoffset2 + width / 2+gap,height,prompt2);

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
