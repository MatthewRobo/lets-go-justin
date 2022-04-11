/// @description Insert description here
// You can write your code in this editor

shotcount = 5;

pads = "";

for (var p = 0; p < PLAYERS; p++;)
{
	i = global.lookup[p];
	if (!ready[p]) {
		if global.pressed[i][input.L] {
			global.shots[p]--;
			audio_play_sound(snd_shield,0,0);
		}
		if global.pressed[i][input.R] {
			global.shots[p]++;
			audio_play_sound(snd_shield,0,0);
		}
		if global.pressed[i][input.ST] {
			ready[p] = true;
			audio_play_sound(snd_parry,0,0);
		}
	}
	if (global.shots[p] < 0) global.shots[p] += shotcount;
	global.shots[p] = global.shots[p] mod shotcount;
}

if (ready[0] && ready[1]) room_goto_next();



