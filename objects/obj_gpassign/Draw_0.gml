/// @description Insert description here
// You can write your code in this editor

draw_set_alpha(1);
draw_set_colour(c_white);
draw_set_font(Font1);
draw_set_halign(fa_center);
draw_set_valign(fa_top);

xdraw = room_width / 2;
ydraw = 60;

bottomtext = "";
draw_set_color(c_white);
draw_text(xdraw + 000, ydraw, "Controller");
draw_set_color(global.color[0]);


draw_text(xdraw - 256, ydraw, "Player 1");
draw_set_color(global.color[1]);
draw_text(xdraw + 256, ydraw, "Player 2");

ydraw += 120;


for (var i = 0; i < GP+KB; i++;)
{
	draw_set_colour(global.fgcolor2);
	if (position[i] != -99) {
		for (p = 0; p < PLAYERS; p++) {
			if (ready[p] == i) draw_set_colour(global.color[p]);
		}
		label = "";
		if (i < GP) {
			label = gamepad_get_description(i);
			if (gamepad_axis_value(i, gp_axislh) != 0 && abs(gamepad_axis_value(i, gp_axislh)) != 1 ) bottomtext = "THIS GAME WAS MADE FOR DIGITAL INPUT\nANALOGUE WILL BE A WORSE EXPERIENCE\n";
		} else {
			label = "Keyboard " + string(i mod KB + 1);
		}
		posdraw = position[i];
		switch position[i] {
		case 0: posdraw = -1;
		break;
		case 1: posdraw = 1;
		break;
		case -1: posdraw = 0;
		break;
		}
		draw_text(xdraw + 256 * posdraw, ydraw, label);
		ydraw += 60;
	}
}

draw_set_colour(c_white);

draw_set_font(Font1);
draw_set_halign(fa_center);
draw_set_valign(fa_bottom);
//draw_text(xdraw, room_height - 20, "YOU CAN ONLY USE THE DPAD, THIS IS ON PURPOSE\nPress left/right to select\nPress start when ready\nPress select for training mode");
bottomtext += "Press left/right to select\nPress start when ready\nPress select for training mode";
draw_text(xdraw, room_height - 20, bottomtext);
