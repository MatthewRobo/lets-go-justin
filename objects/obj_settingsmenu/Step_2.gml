var volstring = global.musicgain > 0 ? string(global.musicgain*10) + "%" : "OFF";
options[0] = "Music: " + volstring;
options[1] = "Palette: " + string(global.palette);
if (global.palettelock) options[1] += " (locked)";

if (global.inassign) {
	accepting = false;
	alarm[0] = 2;
}

for (var device = 0; device < GP+KB; device++) {
	if (!global.inassign && accepting) {
		if (global.pressed[device][input.U]) {
			selected--;
			audio_play_sound(snd_shield,0,0);
		}
		if (global.pressed[device][input.D]) {
			selected++;
			audio_play_sound(snd_shield,0,0);
		}
		selected = intwrap(selected, 0, o_len);
		if (global.pressed[device][input.L]) {
			switch selected {
				case 0:
					global.musicgain--;
					audio_play_sound(snd_shield,0,0);
					break;
				case 1:
					global.palette--;
					audio_play_sound(snd_shield,0,0);
					break;
			}
		}
		if (global.pressed[device][input.R]) {
			switch selected {
				case 0:
					global.musicgain++;
					audio_play_sound(snd_shield,0,0);
					break;
				case 1:
					global.palette++;
					audio_play_sound(snd_shield,0,0);
					break;
			}
		}
		if (global.pressed[device][input.ST] || global.pressed[device][input.SL]) {
			switch selected {
				case 0:
					audio_stop_sound(obj_playlist.nowplaying);
					audio_play_sound(snd_parry,0,0);
					break;
				case 1:
					audio_play_sound(snd_parry,0,0);
					global.palettelock = !global.palettelock;
					break;
				case 2:
					window_set_fullscreen(!window_get_fullscreen()); break;
				case 3:
					instance_create_depth(0,0,-10000,obj_inputassign); break;
				case 4:
					instance_destroy(); break;
			}
		}
		if (global.pressed[device][input.SH] || global.pressed[device][input.SE]) {
			instance_destroy();
		}
	}
}

openlerp = lerp(openlerp,1,lerpfactor);
selectedlerp = lerp(selectedlerp,selected,lerpfactor);

alphalerp = lerp(alphalerp, 1, lerpfactor);