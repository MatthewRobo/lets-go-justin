/// @description Insert description here
// You can write your code in this editor
draw_set_font(Font1);
draw_set_valign(fa_top);

draw_set_alpha(1*!GREYBOX);

var pipgap = 4;
var centergap = 32;
var pipwidth = ((64 * 9.5 - centergap) - pipgap * global.firstto) / global.firstto;

piptotal = pipgap + pipwidth;
if (global.pmax==4) {
	for (i = 0; i < (global.firstto - obj_player1.deaths - obj_player3.deaths); i++) {
		draw_set_colour(global.color[0]);
		drawpos = room_width / 2 - centergap - piptotal * i;
		draw_rectangle(drawpos-pipwidth, 8, drawpos, 56,0);
		if (obj_player1.dead || obj_player3.dead) {
			draw_set_color(global.fgcolor2);
			drawpos = room_width / 2 - centergap - piptotal * (i + 1);
			var pipsum = sign(obj_player1.dead) + sign(obj_player3.dead);
			var deadmax = max(obj_player1.dead,obj_player3.dead);
			draw_rectangle(drawpos-(pipsum*global.hitstop*pipwidth/deadmax), 8, drawpos, 56,0);
		}
	}
	for (i = 0; i < (global.firstto - obj_player2.deaths - obj_player4.deaths); i++) {
		draw_set_colour(global.color[1]);
		drawpos = room_width / 2 + centergap + piptotal * i;
		draw_rectangle(drawpos, 8, drawpos+pipwidth, 56,0);
		if (obj_player2.dead || obj_player4.dead) {
			draw_set_color(global.fgcolor2);
			drawpos = room_width / 2 + centergap + piptotal * (i + 1);
			var pipsum = sign(obj_player2.dead) + sign(obj_player4.dead);
			var deadmax = max(obj_player2.dead,obj_player4.dead);
			draw_rectangle(drawpos, 8, drawpos+(pipsum*global.hitstop*pipwidth/deadmax), 56,0);
		}
	}
} else {
	for (i = 0; i < (global.firstto - obj_player1.deaths); i++) {
		draw_set_colour(global.color[0]);
		drawpos = room_width / 2 - centergap - piptotal * i;
		draw_rectangle(drawpos-pipwidth, 8, drawpos, 56,0);
		if (obj_player1.dead) {
			draw_set_color(global.fgcolor2);
			drawpos = room_width / 2 - centergap - piptotal * (i + 1);
			draw_rectangle(drawpos-(global.hitstop*pipwidth/obj_player1.dead), 8, drawpos, 56,0);
		}
	}
	for (i = 0; i < (global.firstto - obj_player2.deaths); i++) {
		draw_set_colour(global.color[1]);
		drawpos = room_width / 2 + centergap + piptotal * i;
		draw_rectangle(drawpos, 8, drawpos+pipwidth, 56,0);
		if (obj_player2.dead) {
			draw_set_color(global.fgcolor2);
			drawpos = room_width / 2 + centergap + piptotal * (i + 1);
			draw_rectangle(drawpos, 8, drawpos+(global.hitstop*pipwidth/obj_player2.dead), 56,0);
		}
	}
}


draw_set_colour(global.fgcolor2);
draw_set_halign(fa_center);
draw_set_valign(fa_top);
var text = global.mode == gamemode.training ? string(fps) : string_replace_all(string_format(seconds, 2, 0), " ", "0")
draw_text(room_width/2,8,text);
draw_set_valign(fa_bottom);
//draw_rectangle(room_width/2-1, 4, room_width/2+1, 59,0);

if (roundstart > 0) {
	draw_set_font(fnt_large);
	draw_text(room_width/2, room_height/2, "Ready?");
	draw_rectangle(room_width/2-roundstart, 388, room_width/2+roundstart, 392,0);
}

draw_set_font(fnt_smallsemi);
draw_set_valign(fa_bottom);
draw_rectangle(room_width/2-1, 768-64, room_width/2+1, 768,0);
draw_set_halign(fa_right);


var _x1 = lerp(-pi,pi,restart);
var _x2 = lerp(-pi,pi,quit);
var _e = 2.718281828459;
var mult = 1.01;
var _ans1 = (power(_e, 2*_x1)-1)/(power(_e, 2*_x1)+1);
_ans1 = clamp((_ans1*mult + 1) / 2,0,1);
var _ans2 = (power(_e, 2*_x2)-1)/(power(_e, 2*_x2)+1);
_ans2 = clamp((_ans2*mult + 1) / 2,0,1);
//draw_rectangle(0, room_height - 16, 0.5*(dsin(timer * 180 + 270)+1) * room_width, room_height,0);
draw_rectangle(room_width/2, room_height - 3,-_ans1*room_width/2+room_width/2, room_height,0);
draw_rectangle(room_width/2, room_height - 3, _ans2*room_width/2+room_width/2, room_height,0);

if (global.mode == gamemode.training) {
	draw_text(-_ans1*room_width/2+room_width / 2-centergap, 768-4, "Select to restart");
} else {
	draw_text(-_ans1*room_width/2+room_width / 2-centergap, 768-4, "Hold Select to restart");
}
draw_set_halign(fa_left);
draw_text(_ans2*room_width/2+room_width/2+centergap, 768-4, "Hold Start to quit");

//draw_rectangle(room_width/2, 768-3, room_width/2 - 2 * restart, 768,0);
//draw_rectangle(room_width/2, 768-3, room_width/2 + 2 * quit, 768,0);


//draw_rectangle(room_width/2, 768-4, room_width/2 - 2 * restart, 768-8,0);
//draw_rectangle(room_width/2, 768-4, room_width/2 + 2 * quit, 768-8,0);

draw_set_valign(fa_middle);
draw_set_font(fnt_large);
if (global.pmax == 4) {
	if (obj_player1.deaths + obj_player3.deaths == global.firstto) 
	|| (obj_player1.deaths + obj_player3.deaths == global.firstto + 1) {
		draw_set_colour(global.color[1]);
		draw_set_halign(fa_center);
		draw_text(room_width/2, room_height/2, "TEAM 2\nWIN");
	}

	if (obj_player2.deaths + obj_player4.deaths == global.firstto) 
	|| (obj_player2.deaths + obj_player4.deaths == global.firstto + 1) {
		draw_set_colour(global.color[0]);
		draw_set_halign(fa_center);
		draw_text(room_width/2, room_height/2, "TEAM 1\nWIN");
	}
} else {
	if (obj_player1.deaths == global.firstto) {
		draw_set_colour(global.color[1]);
		draw_set_halign(fa_center);
		draw_text(room_width/2, room_height/2, "PLAYER 2\nWIN");
	}
	if (obj_player2.deaths == global.firstto) {
		draw_set_colour(global.color[0]);
		draw_set_halign(fa_center);
		draw_text(room_width/2, room_height/2, "PLAYER 1\nWIN");
	}
}


