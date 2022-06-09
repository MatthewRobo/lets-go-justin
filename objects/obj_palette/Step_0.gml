if (!global.inassign && instance_number(obj_controller) <= 0) {
	for (var device = 0; device < GP+KB; device++) {
		if (global.pressed[device][input.JU]) {
			global.palette++;
			audio_play_sound(snd_shield,0,0);
		}
		if (global.pressed[device][input.PA]) {
			global.palette--;
			audio_play_sound(snd_shield,0,0);
		}
	}
}

global.palette = intwrap(global.palette,0,PALETTES);
global.thingy = intwrap(global.thingy,0,thingies.length);

switch global.palette {
	case 0:
		global.color[0] = #ff0051;
		global.color[1] = #0080ff;
		global.color[2] = #ff5100;
		//global.color[3] = #00cccc;
		global.color[3] = #00ccff;
		//global.bgcolor = #1f1209;
		//global.fgcolor = #665544;
		//global.bgcolor = #222222;
		global.bgcolor = #16161d;
		//global.fgcolor = #3f3f3f;
		global.fgcolor = #4f4f69;
		global.fgcolor2 = #ffcc99;
		global.textcolor = c_white;
		break;
	case 1: // GREEN PURPLE
		global.color[0] = #00ff0d;
		global.color[1] = #9900ff
		global.color[2] = #90ff90;
		global.color[3] = #aa66ff
		//global.bgcolor = #211400;
		global.fgcolor = #413735;
		global.bgcolor = #0f0805;
		//global.fgcolor = #442233;
		global.fgcolor2 = #ffaaff;
		global.textcolor = c_white;
		break;
	case 2: // M-AS
		global.color[0] = #ffcd6e;
		global.color[1] = #9b59b5;
		global.color[2] = #ffab8e;
		global.color[3] = #b5599b;
		global.bgcolor = #16161d;
		global.fgcolor = #272733;
		global.fgcolor2 = #f8f8f8;
		global.textcolor = c_white;
		break;
	case 3: // GREEN ORANGE
		global.color[0] = #ff8000;
		global.color[1] = #009479;
		global.color[2] = #ffcc00;
		global.color[3] = #0093cd;
		global.bgcolor = #001d23;
		global.fgcolor = #331f07;
		global.fgcolor2 = #ffc073;
		global.textcolor = c_white;
		break;
	case 4: // BLUE ORANGE
		global.color[0] = #ff8000;
		global.color[1] = #0093cd;
		global.color[2] = #ffcc00;
		global.color[3] = #009479;
		global.bgcolor = #001d46;
		global.fgcolor = #553402;
		global.fgcolor2 = #ffb63e;
		global.textcolor = c_white;
		break;
	case 5: // RED BLUE
		global.color[0] = #e64137;
		global.color[1] = #008cff;
		global.color[2] = #ff8000;
		global.color[3] = #33ccff;
		global.bgcolor = #300a2b;
		global.fgcolor = #001e80;
		global.fgcolor2 = #3fffe1;
		global.textcolor = c_white;
		break;
	case 6: // COOL DAY
		global.color[0] = #ff0080;
		global.color[1] = #80ffff;
		global.color[2] = #ff00ff;
		global.color[3] = #00ccff;
		global.bgcolor = #025592;
		global.fgcolor = #47002b;
		global.fgcolor2 = #ff51a8;
		global.textcolor = c_white;
		break;
	case 7: // PAC MAN
		global.color[0] = c_red;
		global.color[1] = c_aqua;
		global.color[2] = c_orange;
		global.color[3] = #0080ff;
		global.bgcolor = #090909;
		global.fgcolor = #0000aa;
		global.fgcolor2 = c_yellow;
		global.textcolor = c_white;
		break;
	case 8: // JET GRIND RADIO
		global.color[0] = #e2e442;
		global.color[1] = #83c142;
		global.color[2] = #eda939;
		global.color[3] = #00c1c1;
		global.bgcolor  = #3f3682;
		global.fgcolor  = #801B12;
		global.fgcolor2 = #c44f50;
		global.textcolor = c_white;
		break;
	case 9: // VASQUEZ
		global.color[0] = #fecc04;
		global.color[1] = #901449;
		global.color[2] = #ccfe04;
		global.color[3] = #491490;
		global.bgcolor = #889382;
		global.fgcolor = #4f564d;
		global.fgcolor2 = c_black;
		global.textcolor = c_white;
		break;
	case 10: // WORDLE
		global.color[0] = #b59f3b;
		global.color[1] = #538d4e;
		global.color[2] = #f5793a;
		global.color[3] = #85c0f9;
		global.bgcolor = #121213;
		global.fgcolor = #3a3a3c;
		global.fgcolor2 = #818384;
		global.textcolor = c_white;
		break;
	case 11: // PICO-8
		global.color[0] = #ff77a8;
		global.color[1] = #00e436;
		global.color[2] = #ffae00;
		global.color[3] = #29adff;
		global.bgcolor = #1d2b53;
		global.fgcolor = #5f574f;
		global.fgcolor2 = #ffccaa;
		global.textcolor = c_white;
		break;
	case 12: // VIDEOBALL
		global.color[0] = #f26554;
		global.color[1] = #01a6b9;
		global.color[2] = #f26554;
		global.color[3] = #01a6b9;
		global.bgcolor = #302520;
		global.fgcolor = #6B5042;
		global.fgcolor2 = #FFABF1;
		//global.fgcolor = #9f6b96;
		//global.fgcolor2 = #ffffff;
		global.textcolor = c_white;
		break;
	case 13: // POLKA
		global.color[0] = #ffaad2;
		global.color[1] = #009de7;
		global.color[2] = #f12132;
		global.color[3] = #00abe6;
		global.bgcolor = #7c635c;
		global.fgcolor = #7a4686;
		global.fgcolor2 = #ffefd4;
		global.textcolor = c_white;
		break;
	case 14: // RED PURPLE
		global.color[0] = #FF2C29;
		global.color[1] = #9876F5;
		global.color[2] = #f12132;
		global.color[3] = #00abe6;
		global.bgcolor = #110011;
		global.fgcolor = #2B0041;
		global.fgcolor2 = #FFBB6D;
		global.textcolor = c_white;
		break;
	case 15: // TRANS PRIDE
		global.color[0] = #fdabb8;
		global.color[1] = #2bcff7;
		global.bgcolor = #282828;
		global.fgcolor = #999999;
		global.fgcolor2 = c_white;
		global.textcolor = c_white;
		break;
	case 16: // SEATTLE BASEBALL
		global.color[0] = #ed6b69;
		global.color[1] = #a6cc70;
		global.bgcolor = #111d28;
		global.fgcolor = #1c3649;
		global.fgcolor2 = #469d96;
		global.textcolor = c_white;
		break;
	case 17: // CHATREUSE PURPLE
		global.color[0] = #d8f700;
		global.color[1] = #ff00ff;
		global.bgcolor = #110011;
		global.fgcolor = #2B0041;
		global.fgcolor2 = #9b59b5;
		global.textcolor = c_white;
		break;
	case 18: // CMYK
		global.color[0] = #FFFF00;
		global.color[1] = #00FFFF;
		global.bgcolor = #222222;
		global.fgcolor = #000000;
		global.fgcolor2 = #FF00FF;
		global.textcolor = c_white;
		break;
	case 19: // uhhh
		global.color[0] = c_fuchsia;
		global.color[1] = c_lime;
		global.bgcolor = c_black;
		global.fgcolor = c_white;
		global.fgcolor2 = #FF8000;
		global.textcolor = c_white;
		break;
	//case 9: // PAPER
	//	global.color[0] = c_green;
	//	global.color[1] = c_blue;
	//	global.bgcolor = global.textcolor;
	//	global.fgcolor = c_grey;
	//	global.fgcolor2 = c_black;
	//	break;
}

global.color[2] = global.color[0];
global.color[3] = global.color[1];

if (GREYBOX) {
	global.color[0] = c_yellow;
	global.color[1] = c_aqua;
	global.bgcolor = c_black;
	global.fgcolor = global.textcolor;
	global.fgcolor2 = c_grey;
}

gbid = layer_background_get_id("background");
layer_background_blend(gbid, global.bgcolor);


