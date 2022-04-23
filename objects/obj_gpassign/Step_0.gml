/// @description Insert description here
// You can write your code in this editor

pads = "";

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
	
	if global.pressed[i][input.L] {
		//if (position[i] == -99) position[i] = -1;
		position[i]++;
		if (!readypos[i]) audio_play_sound(snd_shield,0,0);
	}
	if global.pressed[i][input.R] {
		//if (position[i] == -99) position[i] = -1;
		 position[i]--;
		if (!readypos[i]) audio_play_sound(snd_shield,0,0);
	}
	
	if (position[i] != -99) {
		if (position[i] < -1) position[i] += 3;
		position[i] = ((position[i] + 1) mod 3) - 1;
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
		}
		else {
		global.mode = gamemode.training;
		global.lookup[0] = i;
		if (global.lookup[1] < 0 || global.lookup[1] == i) {
			global.lookup[1] = GP+KB;
		}
		audio_play_sound(snd_parry,0,0)
		room_goto_next();
		}
	}
	
	for (p = 0; p < PLAYERS; p++) {
		if (ready[p] == i) position[i] = p;
	}
}

if (ready[0] > -99 && ready[1] > -99) {
	room_goto_next();
	global.mode = gamemode.versus;
}
//show_debug_message("ready" + string(ready));
//show_debug_message(position);
//show_debug_message(global.lookup);
