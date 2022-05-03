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
	draw_set_colour(global.color[0]);
	for (i = 0; i < (global.firstto - obj_player1.deaths - obj_player3.deaths); i++) {
		drawpos = room_width / 2 - centergap - piptotal * i;
		draw_rectangle(drawpos-pipwidth, 8, drawpos, 56,0);
		if (obj_player1.spawntime == obj_player1.spawning && i == (global.firstto - obj_player1.deaths - obj_player3.deaths - 1))
		|| (obj_player3.spawntime == obj_player3.spawning && i == (global.firstto - obj_player3.deaths - obj_player1.deaths - 1)){
			draw_set_color(global.fgcolor2);
			drawpos = room_width / 2 - centergap - piptotal * (i + 1);
			draw_rectangle(drawpos-global.hitstop, 8, drawpos, 56,0);
		}
	}
	draw_set_colour(global.color[1]);
	for (i = 0; i < (global.firstto - obj_player2.deaths - obj_player4.deaths); i++) {
		drawpos = room_width / 2 + centergap + piptotal * i;
		draw_rectangle(drawpos, 8, drawpos+pipwidth, 56,0);
		if (obj_player2.spawntime == obj_player2.spawning && i == (global.firstto - obj_player2.deaths - obj_player4.deaths - 1))
		|| (obj_player4.spawntime == obj_player4.spawning && i == (global.firstto - obj_player4.deaths - obj_player2.deaths -1)) {
			draw_set_color(global.fgcolor2);
			drawpos = room_width / 2 + centergap + piptotal * (i + 1);
			draw_rectangle(drawpos, 8, drawpos+global.hitstop, 56,0);
		}
	}
} else {
	draw_set_colour(global.color[0]);
	for (i = 0; i < (global.firstto - obj_player1.deaths); i++) {
		drawpos = room_width / 2 - centergap - piptotal * i;
		draw_rectangle(drawpos-pipwidth, 8, drawpos, 56,0);
		if (obj_player1.spawntime == obj_player1.spawning && i == (global.firstto - obj_player1.deaths - 1)) {
			draw_set_color(global.fgcolor2);
			drawpos = room_width / 2 - centergap - piptotal * (i + 1);
			draw_rectangle(drawpos-global.hitstop, 8, drawpos, 56,0);
		}
	}
	draw_set_colour(global.color[1]);
	for (i = 0; i < (global.firstto - obj_player2.deaths); i++) {
		drawpos = room_width / 2 + centergap + piptotal * i;
		draw_rectangle(drawpos, 8, drawpos+pipwidth, 56,0);
		if (obj_player2.spawntime == obj_player2.spawning && i == (global.firstto - obj_player2.deaths - 1)) {
			draw_set_color(global.fgcolor2);
			drawpos = room_width / 2 + centergap + piptotal * (i + 1);
			draw_rectangle(drawpos, 8, drawpos+global.hitstop, 56,0);
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

draw_set_font(Font1);
draw_text(room_width / 2, 768-4, "Hold Start to quit / Hold Select to restart");

draw_rectangle(room_width/2, 768-4, room_width/2 - 2 * quit, 768-8,0);
draw_rectangle(room_width/2, 768-4, room_width/2 + 2 * restart, 768-8,0);

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


