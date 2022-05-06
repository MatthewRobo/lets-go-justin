if (!global.inassign) {
	for (var device = 0; device < GP+KB; device++) {

	//for (var player = 0; player < PLAYERS; player++) {
	//	var device = global.lookup[player];
		if (global.pressed[device][input.ST]) {
			if (selected == 0) {
				selected = irandom_range(1,roomlen-1);
				audio_play_sound(snd_slash,0,0);
			} else if !global.banlist[selected] {
				global.stage = rooms[selected];
				room_goto_next();
			} else {
				audio_play_sound(snd_land,0,0);
				banlerp[selected] = 1.5;
			}
		} else {
			if (global.pressed[device][input.L]) {
				selected--;
				audio_play_sound(snd_shield,0,0);
			}
			if (global.pressed[device][input.R]) {
				selected++;
				audio_play_sound(snd_shield,0,0);
			}
			if (selected != 0) {
				if (global.pressed[device][input.D]) {
					if !global.banlist[selected] {
						global.banlist[selected] = true;
						audio_play_sound(snd_shield,0,0);
					} else {
						audio_play_sound(snd_land,0,0);
						banlerp[selected] = 1.5;
					}
				}
				if (global.pressed[device][input.U]) {
					if global.banlist[selected] {
						global.banlist[selected] = false;
						audio_play_sound(snd_shield,0,0);
					} else {
						audio_play_sound(snd_land,0,0);
						banlerp[selected] = -0.5;
					}
				}
			} else {
				if (global.pressed[device][input.D]) {
					audio_play_sound(snd_land,0,0);
					banlerp[selected] = 0.5;
				}
				if (global.pressed[device][input.U]) {
					audio_play_sound(snd_land,0,0);
					banlerp[selected] = -0.5;
				}
			}
			if (global.pressed[device][input.SE]) {
				room_goto_previous();
			}
		}
		if (selected == -1) selectedlerp += roomlen;
		if (selected == roomlen) selectedlerp -= roomlen;
		selected = (selected + roomlen) mod roomlen;
	}
}

selectedlerp = lerp(selectedlerp,selected,lerpfactor);

prevgap = lerp(prevgap, 10, 0.2);
zoomgap = lerp(zoomgap, (room_width-zoomsize)/2+10, 0.2);

for (var i = 0; i < roomlen; i++) {
	banlerp[i] = lerp(banlerp[i],global.banlist[i],0.3);
}
