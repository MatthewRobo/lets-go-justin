/// @description Insert description here
// You can write your code in this editor
global.hitstop = 0;
global.outline = c_white;
global.firstto = -1;
pads = "";
if (!global.inassign) {
	for (var p = 0; p < global.pmax; p++;)
	{
		i = global.lookup[p]; // i = is INPUT port
		if (global.mode == gamemode.versus) {
			if (!ready[p]) {
				shotlast = global.shots[p];
				collast = shotlast mod cols;
				rowlast = shotlast div cols;
			
				//show_debug_message(string(collast) + "|" +string(rowlast));
				if global.pressed[i][input.U] {
					global.shots[p]-=cols;
					//if (global.shots[p] mod cols != collast) global.shots[p] ++;
					audio_play_sound(snd_shield,0,0);
					with(preview[p]) {
						event_user(0);
					}
				}
				if global.pressed[i][input.D] {
					global.shots[p]+=cols;
					//if (global.shots[p] mod cols != collast) global.shots[p] --;
					audio_play_sound(snd_shield,0,0);
					with(preview[p]) {
						event_user(0);
					}
				}
				if global.pressed[i][input.L] {
					global.shots[p]--;
					if (global.shots[p] div cols != rowlast) global.shots[p] += cols;
					audio_play_sound(snd_shield,0,0);
					with(preview[p]) {
						event_user(0);
					}
				}
				if global.pressed[i][input.R] {
					global.shots[p]++;
					if (global.shots[p] div cols != rowlast) global.shots[p] -= cols;
					audio_play_sound(snd_shield,0,0);
					with(preview[p]) {
						event_user(0);
					}
				}
				if global.pressed[i][input.ST] {
					ready[p] = true;
					audio_play_sound(snd_parry,0,0);
				}
				if global.pressed[i][input.SE] {
					room_goto(Instructions);
					audio_play_sound(snd_parry,0,0);
				}
			} else if global.pressed[i][input.SE] {
					ready[p] = false;
					audio_play_sound(snd_shield,0,0);
				}
		} else if (global.mode == gamemode.training) {
			if (!ready[0]) {
				var _p = 0;
				if global.pressed[i][input.U] {
					global.shots[_p]-=cols;
					audio_play_sound(snd_shield,0,0);
					with(preview[_p]) {
						event_user(0);
					}
				}
				if global.pressed[i][input.D] {
					global.shots[_p]+=cols;
					audio_play_sound(snd_shield,0,0);
					with(preview[_p]) {
						event_user(0);
					}
				}
				if global.pressed[i][input.L] {
					global.shots[_p]--;
					audio_play_sound(snd_shield,0,0);
					with(preview[_p]) {
						event_user(0);
					}
				}
				if global.pressed[i][input.R] {
					global.shots[_p]++;
					audio_play_sound(snd_shield,0,0);
					with(preview[_p]) {
						event_user(0);
					}
				}
				if global.pressed[i][input.ST] {
					ready[_p] = true;
					audio_play_sound(snd_parry,0,0);
				}
				if global.pressed[i][input.SE] {
					room_goto(Pad_Select);
					audio_play_sound(snd_parry,0,0);
				}
			} else if (!ready[1]) {
				_p = 1;
				if global.pressed[i][input.U] {
					global.shots[_p]-=cols;
					audio_play_sound(snd_shield,0,0);
					with(preview[_p]) {
						event_user(0);
					}
				}
				if global.pressed[i][input.D] {
					global.shots[_p]+=cols;
					audio_play_sound(snd_shield,0,0);
					with(preview[_p]) {
						event_user(0);
					}
				}
				if global.pressed[i][input.L] {
					global.shots[_p]--;
					audio_play_sound(snd_shield,0,0);
					with(preview[_p]) {
						event_user(0);
					}
				}
				if global.pressed[i][input.R] {
					global.shots[_p]++;
					audio_play_sound(snd_shield,0,0);
					with(preview[_p]) {
						event_user(0);
					}
				}
				if global.pressed[i][input.ST] {
					ready[_p] = true;
					audio_play_sound(snd_parry,0,0);
				}
				if global.pressed[i][input.SE] {
					ready[0] = false;
					audio_play_sound(snd_shield,0,0);
				}
			}
		}
		if (global.shots[p] < 0) global.shots[p] += shot.length;
		global.shots[p] = global.shots[p] mod shot.length;
	}
}


totalready = 0;
for (i = 0; i < global.pmax; i++) {
	totalready += ready[i];
}
if (totalready >= global.pmax) room_goto_next();

iconframes += 1/5;
iconframes = iconframes mod sprite_get_number(spr_playericon);

xdraw = (room_width - rows*icon_htotal)/2;

shotcounter = 0;
for (var row = 0; row < rows; row++) {
	for (var col = 0; col < cols; col++) {
		var _xdraw = xdraw+icon_htotal*col;
		var _ydraw = ydraw_icon+icon_vtotal*row;
		for (var p = 0; p < global.pmax; p++) {
			if (global.shots[p] == shotcounter) {

				px[p] = _xdraw;
				py[p] = _ydraw;
			}
			_px[p] = lerp(_px[p],px[p],lerpfactor);
			_py[p] = lerp(_py[p],py[p],lerpfactor);
		}
		shotcounter++;
	}
}
