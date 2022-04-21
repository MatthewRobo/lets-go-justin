/// @description Insert description here
// You can write your code in this editor
draw_set_font(Font1);
draw_set_valign(fa_top);

draw_set_alpha(1);

draw_set_colour(global.color[0]);
draw_set_halign(fa_right);
// draw_text(room_width / 2 - 32, 8, obj_player2.deaths);
for (i = 0; i < (global.firstto - obj_player1.deaths); i++) {
	drawpos = room_width / 2 - 10 - 48 * i;
	draw_rectangle(drawpos-44, 8, drawpos, 56,0);
	if (obj_player1.spawntime == obj_player1.spawning && i == (global.firstto - obj_player1.deaths - 1)) {
		draw_primitive_begin(pr_trianglelist);
		draw_vertex(drawpos-44-48,56);
		draw_vertex(drawpos-48,56);
		draw_vertex(obj_player1.x,obj_player1.y);
		draw_primitive_end();
	}
}

draw_set_colour(global.color[1]);
draw_set_halign(fa_left);
//draw_text(room_width / 2 + 32, 8, obj_player1.deaths);
for (i = 0; i < (global.firstto - obj_player2.deaths); i++) {
	drawpos = room_width / 2 + 10 + 48 * i;
	draw_rectangle(drawpos, 8, drawpos+44, 56,0);
	if (obj_player2.spawntime == obj_player2.spawning && i == (global.firstto - obj_player2.deaths - 1)) {
		draw_primitive_begin(pr_trianglelist);
		draw_vertex(drawpos+44+48,56);
		draw_vertex(drawpos+48,56);
		draw_vertex(obj_player2.x,obj_player2.y);
		draw_primitive_end();
	}
}

draw_set_valign(fa_bottom);

draw_set_colour(global.fgcolor2);
draw_set_halign(fa_center);

draw_rectangle(room_width/2-1, 4, room_width/2+1, 59,0);

if (roundstart > 0) {
	draw_text(room_width/2, room_height/2, "Ready?");
	draw_rectangle(room_width/2-roundstart, 388, room_width/2+roundstart, 392,0);
}
draw_text(room_width / 2, 768-4, "Hold Start to quit / Hold Select to restart");

draw_rectangle(room_width/2, 768-4, room_width/2 - 2 * quit, 768-8,0);
draw_rectangle(room_width/2, 768-4, room_width/2 + 2 * restart, 768-8,0);

draw_set_valign(fa_middle);
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


