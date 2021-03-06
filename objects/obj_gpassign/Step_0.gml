/// @description Insert description here
// You can write your code in this editor

start = lerp(start,1,0.2);

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
				case  0: nextpos = teams ? 2 : 1; break;
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
				case  1: nextpos = teams ? 3 : 0; break;
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
				if !readypos[i] audio_play_sound(snd_parry,0,0);
				readypos[i] = true;
			}
		}
	
		if global.pressed[i][input.SE] {
			if (readypos[i]){
				ready[position[i]] = -99;
				readypos[i] = false;
				audio_play_sound(snd_shield,0,0);
			} else {
				room_goto_previous();
			}
		}
	
		for (p = 0; p < PLAYERS; p++) {
			if (ready[p] == i) position[i] = p;
		}
	}
}

if (ready[0] > -99 && ready[1] > -99) {
	if global.mode == gamemode.versus {
		room_goto_next();
		global.lookup[2] = GP+KB;
		global.lookup[3] = GP+KB;
	} else if (ready[2] > -99 && ready[3] > -99 && global.mode == gamemode.teamvs) {
		room_goto_next();
	}
}
//show_debug_message("ready" + string(ready));
//show_debug_message(position);
//show_debug_message(global.lookup);

for (var i = 0; i < GP+KB; i++;)
{
	switch position[i] {
		case 0:  posdraw[i] = lerp(posdraw[i],-1,lerpfactor); break;
		case 1:  posdraw[i] = lerp(posdraw[i], 1,lerpfactor); break;
		case -1: posdraw[i] = lerp(posdraw[i], 0,lerpfactor); break;
		case 2:  posdraw[i] = lerp(posdraw[i],-2,lerpfactor); break;
		case 3:  posdraw[i] = lerp(posdraw[i], 2,lerpfactor); break;
	}
}

if (global.mode == gamemode.training) {
	room_goto_previous();
}
draw_set_font(Font1);
var ydraw = 60;
var vgap = string_height("(Team 12g)");
ydraw += vgap;
for (var i = 0; i < GP+KB; i++;)
{
	draw_set_colour(global.fgcolor2);
	if (position[i] == -99) {
		ypos[i] = lerp(ypos[i],ydraw,lerpfactor);
	}
	if (position[i] != -99) {
		ypos[i] = lerp(ypos[i],ydraw,lerpfactor);
		ydraw += vgap;
	}
}
