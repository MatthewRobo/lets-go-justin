/// @description Insert description here
// You can write your code in this editor


draw_set_colour(global.fgcolor2);
draw_set_alpha(1);
xdraw = room_width / 2;


draw_set_font(Font1);
draw_set_halign(fa_center);
draw_set_valign(fa_top);

ydraw = 24;
mode = "";

switch global.mode {
	case gamemode.versus:
		mode = "Single Versus";
		break;
	case gamemode.teamvs:
		mode = "Team Versus";
		break;
	case gamemode.training:
		mode = "Training Mode";
		break;
}
draw_set_color(global.fgcolor2);
draw_set_valign(fa_top);
ydraw = 20;
draw_text(xdraw,ydraw,mode);

xdraw = (room_width - (cols-1)*icon_htotal)/2;

var shotcounter = 0;
for (var row = 0; row < rows; row++) {
	for (var col = 0; col < cols; col++) {
		if (shotcounter < shot.length) {
			var _xdraw = xdraw+icon_htotal*col - (rows - row) * ((cols-1) / 2 - col) * slant;
			var _ydraw = ydraw_icon+icon_vtotal*row;
			var _shotspr = spr_marksman;
			var _shotstr = "UNNAMED";
			switch shotcounter {
				case shot.bullet:
					_shotstr = "Marksman";
					_shotspr = spr_marksman;
				break;
				case shot.shotgun:
					_shotstr = "Burst";
					_shotspr = spr_shotgun;
				break;
				case shot.wallbang:
					_shotstr = "Wallbanger";
					_shotspr = spr_wallbang;
				break;
				case shot.whiffpunisher:
					_shotstr = "Revolver";
					_shotspr = spr_flicker;
				break;
				case shot.booster:
					_shotstr = "Booster";
					_shotspr = spr_booster;
				break;
				case shot.trailer:
					_shotstr = "Wall";
					_shotspr = spr_trailer;
				break;
				case shot.grenade:
					_shotstr = "Grenade";
					_shotspr = spr_grenade;
				break;
				case shot.geyser:
					_shotstr = "Geyser";
					_shotspr = spr_geyser;
				break;
				case shot.sin:
					_shotstr = "Trig";
					_shotspr = spr_trig;
				break;
				case shot.whip:
					_shotstr = "Whip";
					_shotspr = spr_whip;
				break;
				case shot.wall2:
					_shotstr = "Beam";
					_shotspr = spr_beam;
				break;
				case shot.random:
					_shotstr = "Dice";
					_shotspr = spr_anarchy;
				break;
				case shot.wallbang2:
					_shotstr = "Halo";
					_shotspr = spr_halo;
				break;
				case shot.crossbow:
					_shotstr = "Crossbow";
					_shotspr = spr_crossbow;
				break;
				case shot.coin:
					_shotstr = "Coin";
					_shotspr = spr_coin;
				break;
		}
			for (var p = 0; p < PLAYERS; p++) {
				if (global.shots[p] == shotcounter) {
					global.shotsspr[p] = _shotspr;
					global.shotsstr[p] = _shotstr;
				}
			}
			draw_sprite_ext(_shotspr,0,_xdraw,_ydraw,iconscale,iconscale,0,global.fgcolor2,1);
			draw_set_color(global.textcolor);
			draw_set_valign(fa_top);
			draw_set_font(fnt_smallsemi);
			draw_text(_xdraw,_ydraw+iconsize/2+16,_shotstr);
			shotcounter++;
		}
	}
}

for (var p = 0; p < global.pmax; p++) {
	hvec = 1;
	vvec = 1;
	rot = 0;
	if (global.mode == gamemode.teamvs) {
		switch p {
			case 0: hvec = -1; vvec = -1; rot = 180; break;
			case 1: hvec =  1; vvec = -1; rot =  90; break;
			case 2: hvec = -1; vvec =  1; rot = 270; break;
			//case 3: hvec = 1; vvec = 1; break;
		}
	} else {
		switch p {
			case 0: hvec = -1; vvec =  1; rot = 180; break;
			case 1: hvec =  1; vvec = -1; rot =  90; break;

		}
	}
	//rot += 180;
	_color = ready[p] ? global.textcolor : global.color[p];
				
	draw_set_font(fnt_smalldesc);
	draw_set_color(_color);
	draw_set_valign(fa_middle);
	var pstring = "P";
	if (global.mode == gamemode.teamvs) {
		switch p {
			case 0: pstring += "2"; break;
			case 1: pstring += "3"; break;
			case 2: pstring += "1"; break;
			case 3: pstring += "4"; break;
		}
	} else {
		pstring += string(p+1);
	}
	draw_text(_px[p] + hvec * (iconsize / 2 + 32),_py[p] + vvec * (iconsize / 2),pstring);
				
	hvec = 0.25;
	vvec = 0.25;

	frame = ready[p] ? 0 : iconframes;
	switch p {
		case 1: frame += 16;
		case 2: frame += 8;
	}
	frame = frame mod sprite_get_number(spr_playericon);
	draw_sprite_ext(spr_playericon,frame,_px[p],_py[p],iconscale*hvec,iconscale*vvec,rot,_color,1);
	if (global.pmax == 2) {
		frame = (frame + 8) mod sprite_get_number(spr_playericon);
		switch p {
			case 0: rot = 270; break;
			case 1: rot = 0; break;
		}
		draw_sprite_ext(spr_playericon,frame,_px[p],_py[p],iconscale*hvec,iconscale*vvec,rot,_color,1);
	}
}

draw_set_font(Font1);
for (p = 0; p < global.pmax; p++) {
	ydraw = room_height * 0.75;
	if (p < global.pmax) {
		desc = "";
		switch global.shots[p] {
			case shot.bullet: desc += "Basic shot.\nFast recovery/reload.";
			break;
			case shot.shotgun: desc += "Burst of bullets.\nTwo ammo.";
			break;
			case shot.wallbang: desc += "Big yet short.\nPunches through walls.";
			break;
			case shot.whiffpunisher: desc += "Midrange shots.\nSix ammo.";
			break;
			case shot.booster: desc += "Burst of speed.\nFive ammo.";
			break;
			case shot.trailer: desc += "Deadly wall.\nVery slow.";
			break;
			case shot.grenade: desc += "Has gravity, explodes.\nTwo ammo.";
			break;
			case shot.geyser: desc += "Hits far, then near.\nTwo ammo.";
			break;
			case shot.sin: desc += "Sine, cosine, tangent.\nThree ammo.";
			break;
			case shot.whip: desc += "Some spread.\nTwo ammo.";
			break;
			case shot.wall2: desc += "Lethal beam.\nTwo ammo.";
			break;
			case shot.random: desc += "Get lucky?\nKind of garbage.";
			break;
			case shot.wallbang2: desc += "Slow ring of bullets.\nGoes through walls.";
			break;
			case shot.crossbow: desc += "Marksman with gravity.\nA high skill weapon.";
			break;
			case shot.coin: desc += "Flip a coin.\nHit it to send to opponent.\nTwo ammo.";
			break;
			default: desc += "NO DESCRIPTION EXISTS";
			break;
		}

		k = p == 0 ? room_width * 0.25 : room_width * 0.75;
		draw_set_font(Font1);
		if (global.pmax == 4) {
			switch p {
				case 0: k = room_width * 3 / 8; break;
				case 1: k = room_width * 5 / 8; break;
				case 2: k = room_width * 1 / 8; break;
				case 3: k = room_width * 7 / 8; break;
			}
			draw_set_font(fnt_smalldesc);
			
		}
		
		draw_set_colour(global.textcolor);
		if (ready[p]) draw_set_colour(global.color[p]);
		//draw_set_colour(global.color[p]);
		draw_text(k,ydraw,desc);
		draw_set_font(Font1);
	}
}

var gap = 3;
draw_set_font(fnt_prompt);
draw_set_valign(fa_bottom);
draw_set_halign(fa_right);
var prompt = "Press F4 (keyboard) or down + any three buttons (controller) to rebind controls | Press Start/[A] to confirm | Press Select/[B] to cancel";
draw_set_color(global.fgcolor2);
var rightside = room_width;
draw_rectangle(rightside-string_width(prompt)-gap*2,room_height-string_height(prompt)-gap,rightside,room_height,0);
draw_set_color(global.bgcolor);
draw_text(rightside-gap,room_height,prompt);
