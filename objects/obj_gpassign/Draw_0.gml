/// @description Insert description here
// You can write your code in this editor

draw_set_alpha(1);
draw_set_colour(global.textcolor);
draw_set_font(Font1);
draw_set_halign(fa_center);
draw_set_valign(fa_top);

var xdraw = room_width / 2;
var ydraw = 60;
var vgap = string_height("(Team 12g)");
var prompt = "";
draw_set_color(global.textcolor);
if (teams) {
	hgap = 180;
	header = "Team VS";
} else {
	hgap = 256;
	header = "Single VS";
}
hgap *= start;

draw_text(xdraw + 000, ydraw, header);

if (teams) {
	draw_set_color(global.color[0]);
	draw_text(xdraw - hgap, ydraw, "Player 2");
	draw_set_color(global.color[1]);
	draw_text(xdraw + hgap, ydraw, "Player 3");
	draw_set_color(global.color[2]);
	draw_text(xdraw - 2 * hgap, ydraw, "Player 1");
	draw_set_color(global.color[3]);
	draw_text(xdraw + 2 * hgap, ydraw, "Player 4");


	draw_text_color(xdraw - hgap * 1.5, ydraw-vgap, "Team Hot",global.color[2],global.color[0],global.color[0],global.color[2],1);
	draw_text_color(xdraw + hgap * 1.5, ydraw-vgap, "Team Cool",global.color[1],global.color[3],global.color[3],global.color[1],1);
} else {
	draw_set_color(global.color[0]);
	draw_text(xdraw - hgap, ydraw, "Player 1");
	draw_set_color(global.color[1]);
	draw_text(xdraw + hgap, ydraw, "Player 2");
}

ydraw += vgap * 2;
var usedanalogue = false;
for (var i = 0; i < GP+KB; i++;)
{
	draw_set_colour(global.fgcolor2);
	if (position[i] != -99) {
		for (p = 0; p < PLAYERS; p++) {
			if (ready[p] == i) draw_set_colour(global.color[p]);
		}
		label = device_to_string(i);
		if (i < GP) {
			
			if (gamepad_axis_value(i, gp_axislh) != 0)
			{
				usedanalogue = true;
				if (abs(gamepad_axis_value(i, gp_axislh)) != 1) {
					usinganalogue = true;
				}
			}
		}

		draw_text_transformed(xdraw+hgap*posdraw[i],ypos[i],label,clamp((512+64)/string_width(label),0,1),1,0);
	}
}

if (!usedanalogue && usinganalogue) usinganalogue = false;

draw_set_colour(global.fgcolor2);
var gap = 3;
draw_set_font(fnt_prompt);
draw_set_valign(fa_bottom);
draw_set_halign(fa_right);
if (usinganalogue) prompt = "This game was made for digital input! Using analogue will be a worse experience.\n";
prompt += "Press F4 (keyboard) or down + any three buttons (controller) to rebind controls | Press Start/[A] to confirm | Press Select/[B] to cancel";
draw_rectangle(room_width-string_width(prompt)-gap*2,room_height-string_height(prompt)-gap,room_width,room_height,0);
draw_set_color(global.bgcolor);
draw_text(room_width-gap,room_height,prompt);
