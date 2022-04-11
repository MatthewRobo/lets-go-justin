/// @description Insert description here
// You can write your code in this editor

draw_set_colour(c_white);

xdraw = room_width / 2;
ydraw = room_height / 2;

draw_set_font(Font1);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

//for (p = -1; p < PLAYERS; p++) {
for (p = -1; p < 2; p++) {
	draw_set_colour(c_white);
	text = "";
	if (p < 0) text = "Marksman\n" +
	                  "Shotgun\n" +
	                  "Wallbanger\n" +
	                  "Flicker\n" +
	                  "Booster\n" +
	                  "Wall\n" +
	                  "Grenade";
	else {
		if (ready[p]) draw_set_colour(c_red);
		
		for (i = 0; i < shot.length; i++) {
			if (i == global.shots[p]) text += "P" + string(p+1);
			text += "\n";
		}
	}
	posdraw = p;
	switch p {
		case 0: posdraw = -1;
		break;
		case 1: posdraw = 1;
		break;
		case -1: posdraw = 0;
		break;
	}
	draw_text(xdraw + 160 * posdraw, ydraw, text);
	// draw_text(xdraw + p * 256, ydraw, text);	
}

