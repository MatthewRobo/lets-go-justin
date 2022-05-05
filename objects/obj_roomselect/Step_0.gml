if (!global.inassign) {
	for (var player = 0; player < PLAYERS; player++) {
		var device = global.lookup[player];
		if (global.pressed[device][input.ST]) {
			if (selected == 0) global.stage = rooms[irandom_range(1,roomlen-1)];
			else global.stage = rooms[selected];
			room_goto_next();
		} else {
			if (global.pressed[device][input.L]) {
				selected--;
				audio_play_sound(snd_shield,0,0);
			}
			if (global.pressed[device][input.R]) {
				selected++;
				audio_play_sound(snd_shield,0,0);
			}
			if (global.pressed[device][input.SE]) {
				room_goto_previous();
			}
		}
		if (selected == -1) selectedlerp += roomlen;
		if (selected == roomlen) selectedlerp -= roomlen;
		selected = (selected + roomlen) mod roomlen;
		selectedlerp = lerp(selectedlerp,selected,lerpfactor);
	}
}
