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
	// 2 0 -1 1 3
	if global.pressed[i][input.L] {
		nextpos = 0;
		switch position[i] {
			case -1: nextpos = 0; break;
			case  0: nextpos = 2; break;
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
			case  1: nextpos = 3; break;
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
}

if (ready[0] > -99 && ready[1] > -99) {
	room_goto_next();
	global.mode = gamemode.versus;
}
//show_debug_message("ready" + string(ready));
//show_debug_message(position);
//show_debug_message(global.lookup);
