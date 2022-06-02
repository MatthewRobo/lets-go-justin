global.paused = true;

var _team = array_find_index(global.lookup, device);
color = _team != -1 ? global.color[_team] : global.fgcolor2;

if (global.insettings) {
	accepting = false;
	alarm[0] = 2;
}

if (!global.insettings && !global.inassign && accepting) {
	if (global.pressed[device][input.U]) {
		selected--;
		hidden = false;
		audio_play_sound(snd_shield,0,0);
	}
	if (global.pressed[device][input.D]) {
		selected++;
		hidden = false;
		audio_play_sound(snd_shield,0,0);
	}
	selected = intwrap(selected, 0, o_len);
	if (global.pressed[device][input.ST] || global.pressed[device][input.SL]) {
		if (hidden) hidden = false;
		else {
			switch selected {
				case 0: 
				instance_destroy(); break; //["Resume Game"
				case 1: 
				room_restart(); break; //"Restart Match"
				case 2: global.palette = randomize_palette();
				room_goto(Shot_Select); break; //"Change Shot",
				case 3: global.palette = randomize_palette();
				room_goto(Room_Select); break; //"Change Stage", 
				case 4: 
				instance_create_depth(0,0,depth-1,obj_settingsmenu); break;//"Button Assign", 
				case 5: global.palette = randomize_palette();
				room_goto(Main_Menu); break; //"Quit to Menu"];
			}
		}
	}
	if (global.pressed[device][input.SH]) {
		if (hidden) hidden = false;
		else instance_destroy();
	}
	
	if (global.pressed[device][input.SE]) {
		hidden = !hidden;
		audio_play_sound(snd_land,0,0);
	}
	
	for (var _device = 0; _device < GP+KB; _device++) {
		if (_device != device && global.pressed[_device][input.ST]) {
			var _team = array_find_index(global.lookup, _device);
			color = _team != -1 ? global.color[_team] : global.fgcolor2;
			team = _team;
			device = _device;
			audio_play_sound(snd_parry,0,0);
			hidden = false;
		}
	}
}

openlerp = lerp(openlerp,1,lerpfactor);
selectedlerp = lerp(selectedlerp,selected,lerpfactor);

alphalerp = lerp(alphalerp, !hidden, lerpfactor);