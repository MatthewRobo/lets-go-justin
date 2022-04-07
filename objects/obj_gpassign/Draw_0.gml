/// @description Insert description here
// You can write your code in this editor

draw_set_colour(c_white);

xdraw = 1366 / 2;
ydraw = 120;

for (var i = 0; i < global.gpnum; i++;)
{
	if (global.gp[i] != -99) {
		draw_circle(xdraw + 128 * global.gp[i], ydraw, 20,0);
		ydraw += 60;
	}
	
}

draw_set_font(Font1);
draw_set_halign(fa_center);
draw_text(xdraw, 512, "Press left/right to select\nPress start/enter when ready");
