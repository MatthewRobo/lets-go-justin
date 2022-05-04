/// @description Insert description here
// You can write your code in this editor

pads = "";
if (!global.inassign) {
	for (var i = 0; i < GP+KB; i++)
	{
		for (var j = 0; j < input.length; j++) {
			if global.down[i][j] {
				if (position[i] == -99) {
					position[i] = -1;
					audio_play_sound(snd_jump,0,0);
				}
			}
		}
		if global.pressed[i][input.SH] {
			palette--;
			audio_play_sound(snd_shield,0,0);
		}
		if global.pressed[i][input.PA] {
			palette++;
			audio_play_sound(snd_shield,0,0);
		}
		if global.pressed[i][input.D] || global.pressed[i][input.U] {
			teams = !teams;
			audio_play_sound(snd_parry,0,0);
			if (teams == false) {
				for (var device = 0; device < GP+KB; device++) {
					if (position[device] >= 0) {
						ready[position[device]] = -99;
						readypos[device] = false;
						switch position[device] {
							case 2: nextpos = 0; break;
							case 3: nextpos = 1; break;
							default: nextpos = position[device]; break;
						}
						position[device] = nextpos;

					}
				}
			}
		}
	
		// 2 0 -1 1 3
		if global.pressed[i][input.L] {
			nextpos = 0;
			switch position[i] {
				case -1: nextpos = 0; break;
				case  0: nextpos = teams ? 2 : 1; break;
				case  1: nextpos = -1; break;
				case  2: nextpos = 3; break;
				case  3: nextpos = 1; break;
			}
			position[i] = nextpos;
		
			if (!readypos[i]) audio_play_sound(snd_shield,0,0);
		}
		if global.pressed[i][input.R] {
			nextpos = 0;
			switch position[i] {
				case -1: nextpos = 1; break;
				case  0: nextpos = -1; break;
				case  1: nextpos = teams ? 3 : 0; break;
				case  2: nextpos = 0; break;
				case  3: nextpos = 2; break;
			}
			position[i] = nextpos;
			if (!readypos[i]) audio_play_sound(snd_shield,0,0);
		}
	
		if global.pressed[i][input.ST] {
			if (position[i] >= 0 && position[i] < PLAYERS) {
				for (p = 0; p < GP+KB; p++) {
					if (position[p] == position[i] && p != i) {
						ready[p] = -99;
						position[p] = -1;
						readypos[p] = false;
					}
				}
				global.lookup[position[i]] = i;
				ready[position[i]] = i;
				readypos[i] = true;
				audio_play_sound(snd_parry,0,0);
			}
		}
	
		if global.pressed[i][input.SE] {
			if (readypos[i]){
				ready[position[i]] = -99;
				readypos[i] = false;
				audio_play_sound(snd_shield,0,0);
			} else {
				global.mode = gamemode.training;
				global.lookup[0] = i;
				if (global.lookup[1] < 0 || global.lookup[1] == i) {
					global.lookup[1] = GP+KB;
				}
				global.lookup[2] = GP+KB;
				global.lookup[3] = GP+KB;
				audio_play_sound(snd_parry,0,0)
				room_goto_next();
			}
		}
	
		for (p = 0; p < PLAYERS; p++) {
			if (ready[p] == i) position[i] = p;
		}
	}
}

if (ready[0] > -99 && ready[1] > -99) {
	if !teams {
		room_goto_next();
		global.mode = gamemode.versus;
		global.lookup[2] = GP+KB;
		global.lookup[3] = GP+KB;
	} else if (ready[2] > -99 && ready[3] > -99) {
		room_goto_next();
		global.mode = gamemode.versus;
	}
}
//show_debug_message("ready" + string(ready));
//show_debug_message(position);
//show_debug_message(global.lookup);

palette = (palette + 12) mod 12;

switch palette {
	case 0:
		global.color[0] = $5100ff;
		global.color[1] = $ff8000;
		global.color[2] = $0051ff;
		global.color[3] = $cccc00;
		global.bgcolor = $09121f;
		global.fgcolor = $445566;
		global.fgcolor2 = $99ccff;
		break;
	case 1:
		global.color[0] = $ff0099;
		global.color[1] = $0dff00;
		global.color[2] = $ff66aa;
		global.color[3] = $90ff90;
		global.bgcolor = $05080f;
		global.fgcolor = $332244;
		global.fgcolor2 = $ffaaff;
		break;
	case 2:
		global.color[0] = $6ecdff;
		global.color[1] = $b5599b;
		global.color[2] = $8eabff;
		global.color[3] = $9b59b5;
		global.bgcolor = $1d1616;
		global.fgcolor = $332727;
		global.fgcolor2 = $f8f8f8;
		break;
	case 3: // GREEN ORANGE
		global.color[0] = $0080ff;
		global.color[1] = $799400;
		global.color[2] = $00ccff;
		global.color[3] = $cd9300;
		global.bgcolor = $231d00;
		global.fgcolor = $071f33;
		global.fgcolor2 = $73c0ff;
		break;
	case 4: // BLUE ORANGE
		global.color[0] = $0080ff;
		global.color[1] = $cd9300;
		global.color[2] = $00ccff;
		global.color[3] = $799400;
		global.bgcolor = $461d00;
		global.fgcolor = $023455;
		global.fgcolor2 = $3eb6ff;
		break;
	case 5: // RED BLUE
		global.color[0] = $3741e6;
		global.color[1] = $ff8c00;
		global.color[2] = $0080ff;
		global.color[3] = $ffcc33;
		global.bgcolor = $2b0a30;
		global.fgcolor = $801e00;
		global.fgcolor2 = $e1ff3f;
		break;
	case 6: // COOL DAY
		global.color[0] = $8000ff;
		global.color[1] = $ffff80;
		global.color[2] = $ff00ff;
		global.color[3] = $ffcc00;
		global.bgcolor = $925502;
		global.fgcolor = $2b0047;
		global.fgcolor2 = $a851ff;
		break;
	case 7: // PAC MAN
		global.color[0] = c_red;
		global.color[1] = c_aqua;
		global.color[2] = c_orange;
		global.color[3] = $ff8000;
		global.bgcolor = $090909;
		global.fgcolor = $aa0000;
		global.fgcolor2 = c_yellow;
		break;
	case 8: // JET GRIND RADIO
		global.color[0] = $42e4e2;
		global.color[1] = $42c183;
		global.color[2] = $39a9ed;
		global.color[3] = $c1c100;
		global.bgcolor  = $82363f;
		global.fgcolor  = $121B80;
		global.fgcolor2 = $504fc4;
		break;
	case 9: // VASQUEZ
		global.color[0] = $04ccfe;
		global.color[1] = $491490;
		global.color[2] = $04fecc;
		global.color[3] = $901449;
		global.bgcolor = $829388;
		global.fgcolor = $4d564f;
		global.fgcolor2 = c_black;
		break;
	case 10: // WORDLE
		global.color[0] = $3b9fb5;
		global.color[1] = $4e8d53;
		global.color[2] = $3a79f5;
		global.color[3] = $f9c085;
		global.bgcolor = $131212;
		global.fgcolor = $3c3a3a;
		global.fgcolor2 = $848381;
		break;
	case 11: // PICO-8
		global.color[0] = $a877ff;
		global.color[1] = $36e400;
		global.color[2] = $00aeff;
		global.color[3] = $ffad29;
		global.bgcolor = $532b1d;
		global.fgcolor = $4f575f;
		global.fgcolor2 = $aaccff;
		break;
	//case 9: // PAPER
	//	global.color[0] = c_green;
	//	global.color[1] = c_blue;
	//	global.bgcolor = c_white;
	//	global.fgcolor = c_grey;
	//	global.fgcolor2 = c_black;
	//	break;
}

show_debug_message(palette);


gbid = layer_background_get_id("background");
layer_background_blend(gbid, global.bgcolor);

if (GREYBOX) {
	global.color[0] = c_yellow;
	global.color[1] = c_aqua;
	global.bgcolor = c_black;
	global.fgcolor = c_white;
	global.fgcolor2 = c_grey;
}
