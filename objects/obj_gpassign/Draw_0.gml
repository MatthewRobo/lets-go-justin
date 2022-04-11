/// @description Insert description here
// You can write your code in this editor

draw_set_colour(c_white);
draw_set_font(Font1);
draw_set_halign(fa_center);
draw_set_valign(fa_top);

xdraw = 1344 / 2;
ydraw = 120;


draw_text(xdraw, ydraw, "Player 1");
draw_text(xdraw - 256, ydraw, "Controller");
draw_text(xdraw + 256, ydraw, "Player 2");

ydraw += 120;


for (var i = 0; i < GP+KB; i++;)
{
	draw_set_colour(c_white);
	if (position[i] != -99) {
		for (p = 0; p < PLAYERS; p++) {
			if (ready[p] == i) draw_set_colour(c_red);
		}
		label = "";
		if (i < GP) {
			label = "Gamepad " + string(i + 1);
		} else {
			label = "Keyboard " + string(i mod KB + 1);
		}
		draw_text(xdraw + 256 * position[i], ydraw, label);
		ydraw += 60;
	}
}

draw_set_colour(c_white);

draw_set_font(Font1);
draw_set_halign(fa_center);
draw_text(xdraw, 600, "Press left/right to select\nPress start/enter when ready");
