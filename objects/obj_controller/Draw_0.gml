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
draw_text(room_width / 2, 768-8, "Hold backspace to restart");