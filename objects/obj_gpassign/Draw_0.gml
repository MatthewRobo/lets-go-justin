/// @description Insert description here
// You can write your code in this editor

draw_set_colour(c_white);

xdraw = 1366 / 2;
ydraw = 120;


draw_text(xdraw - 256, ydraw, "Player 1");
draw_text(xdraw, ydraw, "Controller");
draw_text(xdraw + 256, ydraw, "Player 2");

ydraw += 120;


for (var i = 0; i < global.gpnum; i++;)
{
	if (global.gp[i] != -99) {
		/*
		draw_primitive_begin(pr_trianglelist);
		draw_vertex(xdraw, ydraw);
		draw_vertex(xdraw + 256 * global.gp[i], ydraw-20);
		draw_vertex(xdraw + 256 * global.gp[i], ydraw+22);
		draw_primitive_end();
		draw_circle(xdraw + 256 * global.gp[i], ydraw, 20,0);
		*/
		draw_text(xdraw + 256 * global.gp[i], ydraw, "Gamepad " + string(i));
		ydraw += 60;
	}
	
}

draw_set_font(Font1);
draw_set_halign(fa_center);
draw_text(xdraw, 600, "Press left/right to select\nPress start/enter when ready");
