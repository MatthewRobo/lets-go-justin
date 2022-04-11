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
	switch global.shots[i] {
		case 0: selected = "Marksman";
		break;
		case 1: selected = "Shotgun";
		break;
		case 2: selected = "Wallbanger";
		break;
		case 3: selected = "Flicker";
		break;
		case 4: selected = "Booster";
		break;
		case 5: selected = "Wall";
		break;
		case 6: selected = "Grenade";
		break;
	}
	draw_text(xdraw, ydraw, "P" + string(i+1) + " shot: " + selected);	
	ydraw += 60;
}

