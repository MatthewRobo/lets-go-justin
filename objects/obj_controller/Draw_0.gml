/// @description Insert description here
// You can write your code in this editor
draw_set_font(Font1);
draw_set_valign(fa_top);

draw_set_colour(obj_player1.color);
draw_set_halign(fa_right);
draw_text(room_width / 2 - 32, 8, obj_player2.deaths);

draw_set_colour(obj_player2.color);
draw_set_halign(fa_left);
draw_text(room_width / 2 + 32, 8, obj_player1.deaths);

draw_set_valign(fa_bottom);

draw_set_colour(c_white);
draw_set_halign(fa_center);

draw_rectangle(room_width/2, 4, room_width/2+2, 59,0);

if (roundstart > 0) {
	draw_text(room_width/2, room_height/2, "Ready?");
	draw_rectangle(room_width/2-roundstart, 388, room_width/2+roundstart, 392,0);
}
draw_text(room_width / 2, 768-4, "Hold Start to quit / Hold Select to restart");