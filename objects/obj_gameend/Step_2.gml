device = global.lookup[team];

if (!global.insettings && !global.inassign && accepting && ready == -1) {
	if (global.pressed[device][input.U]) {
		selected--;
		audio_play_sound(snd_shield,0,0);
	}
	if (global.pressed[device][input.D]) {
		selected++;
		audio_play_sound(snd_shield,0,0);
	}
	selected = intwrap(selected, 0, o_len);
	if (global.pressed[device][input.ST] || global.pressed[device][input.SL]) {
		ready = selected;
		audio_play_sound(snd_parry,0,0);
	}
}

if (ready != -1) {
	if (global.pressed[device][input.SE] || global.pressed[device][input.SH]) {
		ready = -1;
		audio_play_sound(snd_shield,0,0);
	}
}

openlerp = lerp(openlerp,1,lerpfactor);
selectedlerp = lerp(selectedlerp,selected,lerpfactor);

alphalerp = lerp(alphalerp, !hidden, lerpfactor);

if (ready == 3) {
	randomize_palette();
	room_goto(Main_Menu);
}