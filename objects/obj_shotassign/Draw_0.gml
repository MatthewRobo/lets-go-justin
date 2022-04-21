/// @description Insert description here
// You can write your code in this editor


draw_set_colour(c_white);

xdraw = room_width / 2;


draw_set_font(Font1);
draw_set_halign(fa_center);
draw_set_valign(fa_top);

ydraw = 24;
mode = "";

switch global.mode {
	case gamemode.versus:
		mode = "Local VS";
		break;
	case gamemode.training:
		mode = "Training Mode";
		break;
}


draw_set_valign(fa_middle);
xdraw = room_width / 2;
ydraw = room_height / 8;

shottext = array_create(cols,"");
playertext = array_create(PLAYERS,array_create(cols,""));

for (p = -1; p < 2; p++) {
	draw_set_colour(c_white);
	if (p < 0) {
		for (i = 0; i < shot.length; i++) {
			xpos = i mod cols;
			text = "";
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
				case shot.sin: text += "Trig";
				break;
				case shot.whip: text += "Whip";
				break;
				case shot.wall2: text += "Beam";
				break;
				case shot.random: text += "Random";
				break;
				default: text += "UNNAMED";
				break;
			}
			text += "\n";
			shottext[xpos] += text;
		}
	} else if (p < 2) {

		for (i = 0; i < shot.length; i++) {
			xpos = i mod cols;
			text = "";
			if (p == 1) text += "]";
			if (i == global.shots[p]) {
				if (p == 1) text += "";
				text += "P" + string(p+1);
				if (p == 0) text += "";
			}
			if (p == 0) text += "[";
			text += "\n";
			playertext[p][xpos] += text;
		}
	}
}

ydraw = room_height/3;
gap = string_width("[P1] WALLBANGER [P2]");
pgap = 150;
//draw_set_valign(fa_top);
draw_set_valign(fa_middle);
//vgap = string_height("[]") / cols;
vgap = 0;
for (i = 0; i < cols; i++) {
	j = i - (cols - 1) / 2;
	draw_set_colour(c_white);
	draw_text(xdraw + gap * j, ydraw, shottext[i]);
	for (p = 0; p < PLAYERS; p++) {
		k = p == 0 ? -pgap : pgap;

		l = p == 0 ? -vgap/3 : vgap/3;
		draw_set_colour(c_white);
		if (ready[p]) draw_set_colour(global.color[p]);
		draw_text(xdraw + gap * j + k, ydraw + l, playertext[p][i]);
	}
	ydraw += vgap;
}

ydraw = room_height * 0.75;
for (p = 0; p < PLAYERS; p++) {
	if (p < 2) {
		desc = "";
		switch global.shots[p] {
			case shot.bullet: desc += "Basic shot.\nFast recovery/reload.";
			break;
			case shot.shotgun: desc += "Spread shot.\nShort range.";
			break;
			case shot.wallbang: desc += "Big and slow.\nGoes through walls.";
			break;
			case shot.whiffpunisher: desc += "Midrange shots.\nSix ammo.";
			break;
			case shot.booster: desc += "Burst of speed.\nFive ammo.";
			break;
			case shot.trailer: desc += "Deadly wall.\nVery slow.";
			break;
			case shot.grenade: desc += "Has gravity.\nExplodes.";
			break;
			case shot.geyser: desc += "Hits far, then near.\nTwo ammo.";
			break;
			case shot.sin: desc += "Sine, cosine, tangent.\nThree ammo.";
			break;
			case shot.whip: desc += "Some spread.\nTwo ammo.";
			break;
			case shot.wall2: desc += "Lethal beam.\nRather sluggish.";
			break;
			case shot.random: desc += "Random bullshit.";
			break;
			default: desc += "NO DESCRIPTION EXISTS";
			break;
		}
		k = p == 0 ? room_width * 0.25 : room_width * 0.75;
		draw_set_colour(c_white);
		//draw_set_colour(global.color[p]);
		draw_text(k,ydraw,desc);
	}
}


