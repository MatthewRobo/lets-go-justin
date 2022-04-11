/// @description Insert description here
// You can write your code in this editor

draw_set_colour(c_white);

xdraw = 1344 / 2;
ydraw = 768/4;

draw_set_font(Font1);
draw_set_halign(fa_center);
draw_set_valign(fa_top);
for (i = 0; i < PLAYERS; i++) {
	draw_set_colour(c_white);
	if (ready[i]) draw_set_colour(c_red);
	draw_text(xdraw, ydraw, "P" + string(i+1) + " shot: " + string(global.shots[i]));	
	ydraw += 60;
}

