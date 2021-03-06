
if (!global.inassign && !global.insettings) {
	for (var device = 0; device < GP+KB; device++) {

		if global.pressed[device][input.L] {
			global.palette--;
			audio_play_sound(snd_shield,0,0);
			frame = -1;
		}
		if global.pressed[device][input.R] {
			global.palette++;
			audio_play_sound(snd_shield,0,0);
			frame = -1;
		}

		if (expanded) {
			if (global.pressed[device][input.ST]) {
				switch global.mode {
					case gamemode.training:
						global.lookup[0] = device;
						for (var i = 1; i < PLAYERS; i++) {
							global.lookup[i] = GP+KB;
						}
						room_goto(Room_Select);
						break;
					case -1: game_end(); audio_play_sound(snd_parry,0,0); break;
					case -2: instance_create_depth(0,0,depth-1,obj_settingsmenu); break;
					default: room_goto_next(); break;
					
				}
			} else {
				if (global.pressed[device][input.U]) {
					selected--;
					audio_play_sound(snd_shield,0,0);
				}
				if (global.pressed[device][input.D]) {
					selected++;
					audio_play_sound(snd_shield,0,0);
				}
				if global.pressed[device][input.SE] {
					expanded = 0;
					audio_play_sound(snd_shield,0,0);
				}
				//if (global.mode == -2) {
				//	if global.pressed[device][input.L] {
				//		global.musicgain--;
				//		audio_play_sound(snd_shield,0,0);
				//	}
				//	if global.pressed[device][input.R] {
				//		global.musicgain++;
				//		audio_play_sound(snd_shield,0,0);
				//	}
				//}
			}
		} else {
			if (global.pressed[device][input.ST]) {
				expanded = 1;
				audio_play_sound(snd_parry,0,0);
			}
			if global.pressed[device][input.U] {
				global.thingy--;
				audio_play_sound(snd_shield,0,0);
				frame = -1;
			}
			if global.pressed[device][input.D] {
				global.thingy++;
				audio_play_sound(snd_shield,0,0);
				frame = -1;
			}
		}
	}
}

selected = (selected + modelen) mod modelen;
selectedlerp = lerp(selectedlerp,selected,lerpfactor);
global.mode = modes[selected];

openlerp = lerp(openlerp,expanded ? expanded : breath * 0.03 - 0.03,0.2);
breathing++;
breath = dsin(breathing);
if (openlerp > -0.1) frame = clamp(frame + 0.5,0,sprite_get_number(spr_logo)-1);
