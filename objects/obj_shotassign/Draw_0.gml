/// @description Insert description here
// You can write your code in this editor

draw_set_colour(c_white);

xdraw = room_width / 2;


draw_set_font(Font1);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

ydraw = room_height / 8;

switch global.mode {
	case gamemode.versus:
		text = "Local VS";
		break;
	case gamemode.training:
		text = "Training Mode";
		break;
}
draw_text(xdraw, ydraw, text);


ydraw = room_height / 2;

//for (p = -1; p < PLAYERS; p++) {
for (p = -1; p < 2; p++) {
	draw_set_colour(c_white);
	text = "";
	desc = "";
	if (p < 0) {
		for (i = 0; i < shot.length; i++) {
			switch i {
				case shot.bullet: text += "Marksman"; 
				break;
				case shot.shotgun: text += "Shotgun"; 
				break;
				case shot.wallbang: text += "Wallbanger"; 
				break;
				case shot.whiffpunisher: text += "Flicker"; 
				break;
				case shot.booster: text += "Booster"; 
				break;
				case shot.trailer: text += "Wall"; 
				break;
				case shot.grenade: text += "Grenade"; 
				break;
				case shot.geyser: text += "Geyser"; 
				break;
			}
			text += "\n";
		}
	}
	else {
		if (ready[p]) draw_set_colour(c_red);
		
		for (i = 0; i < shot.length; i++) {
			text += "[";
			if (i == global.shots[p]) {
				text += "P" + string(p+1);
				switch i {
					case shot.bullet: desc += "Basic shot.\nFast recovery/reload.";
					break;
					case shot.shotgun: desc += "Spread shot.\nShort range.";
					break;
					case shot.wallbang: desc += "Big and slow.\nGoes through walls.";
					break;
					case shot.whiffpunisher: desc += "Long slashes.\nTwo ammo.";
					break;
					case shot.booster: desc += "Burst of speed.\nFive ammo.";
					break;
					case shot.trailer: desc += "Deadly wall.\nVery slow.";
					break;
					case shot.grenade: desc += "Has gravity.\nExplodes.";
					break;
					case shot.geyser: desc += "Hits far, then near.\nTwo ammo.";
					break;
				}
			}
			text += "]";
			text += "\n";
			desc += "\n";
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
	draw_text(xdraw + ((xdraw + 160)/2 )* posdraw, ydraw, desc);
	// draw_text(xdraw + p * 256, ydraw, text);	
}

