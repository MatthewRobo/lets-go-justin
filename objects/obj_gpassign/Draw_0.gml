/// @description Insert description here
// You can write your code in this editor

draw_set_alpha(1);
draw_set_colour(c_white);
draw_set_font(Font1);
draw_set_halign(fa_center);
draw_set_valign(fa_top);

xdraw = room_width / 2;
ydraw = 60;
vgap = string_height("(Team 12g)");
bottomtext = "";
draw_set_color(c_white);
if (teams) {
	hgap = 180;
	header = "Team VS";
} else {
	hgap = 256;
	header = "Single VS";
}

draw_text(xdraw + 000, ydraw, header);
draw_set_color(global.color[0]);
draw_text(xdraw - hgap, ydraw, "Player 1");
draw_set_color(global.color[1]);
draw_text(xdraw + hgap, ydraw, "Player 2");
if (teams) {
	draw_set_color(global.color[2]);
	draw_text(xdraw - 2 * hgap, ydraw, "Player 3");
	draw_set_color(global.color[3]);
	draw_text(xdraw + 2 * hgap, ydraw, "Player 4");

	draw_set_color(global.color[0]);
	draw_text(xdraw - hgap * 1.5, ydraw-vgap, "Team 1");
	draw_set_color(global.color[1]);
	draw_text(xdraw + hgap * 1.5, ydraw-vgap, "Team 2");
}

ydraw += vgap * 2;


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
		case 0:  posdraw = -1; break;
		case 1:  posdraw =  1; break;
		case -1: posdraw =  0; break;
		case 2:  posdraw = -2; break;
		case 3:  posdraw =  2; break;
		}
		draw_text_transformed(xdraw+hgap*posdraw,ydraw,label,clamp((512+64)/string_width(label),0,1),1,0);
		ydraw += vgap;
	}
}

draw_set_colour(c_white);

draw_set_font(Font1);
draw_set_halign(fa_center);
draw_set_valign(fa_bottom);
//draw_text(xdraw, room_height - 20, "YOU CAN ONLY USE THE DPAD, THIS IS ON PURPOSE\nPress left/right to select\nPress start when ready\nPress select for training mode");
bottomtext += teams ? "Press up/down to switch to single VS\n" : "Press up/down to switch to team VS\n";
bottomtext += "Press left/right to select\nPress start when ready\nPress select for training mode";
draw_text(xdraw, room_height - 20, bottomtext);
