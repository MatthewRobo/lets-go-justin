/// @description Insert description here
// You can write your code in this editor

pads = "";

for (var p = 0; p < PLAYERS; p++;)
{
	i = global.lookup[p];
	if (!ready[p]) {
		if global.pressed[i][input.U] {
			global.shots[p]--;
			audio_play_sound(snd_shield,0,0);
		}
		if global.pressed[i][input.D] {
			global.shots[p]++;
			audio_play_sound(snd_shield,0,0);
		}
		if global.pressed[i][input.ST] {
			ready[p] = true;
			audio_play_sound(snd_parry,0,0);
		}
	}
	if (global.shots[p] < 0) global.shots[p] += shot.length;
	global.shots[p] = global.shots[p] mod shot.length;
}

if (ready[0] && ready[1]) room_goto_next();



