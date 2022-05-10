if !global.browser {
global.musicgain = clamp(global.musicgain,-1,12);
if (global.musicgain > 11) global.musicgain = 0;
if (global.musicgain < 0) global.musicgain = 11;
if (!someonewon) audio_sound_gain(nowplaying,global.musicgain/10*volscl,0);

if (inbattle) {
	if (!someonewon && obj_controller.someonewon) {
		audio_sound_gain(nowplaying,0,0);
		audio_sound_gain(nowplaying,global.musicgain/10*volscl,2500);
		someonewon = true;
	}
} else {
	var hasamenusongplaying = false;
	for (var i = 0; i < array_length(menumus); i++) {
		if (audio_get_name(nowplaying)== audio_get_name(menumus[i])) {
			hasamenusongplaying = true;
		}
	}
	if !hasamenusongplaying {
		audio_stop_sound(nowplaying);
		if (global.musicgain > 0) {
			var newsong = irandom(array_length(menumus)-1);
			nowplaying = audio_play_sound(menumus[newsong],1,0);
			volscl = menuvol[newsong];
			if (room == Main_Menu) {
				if !obj_mainmenu.expanded {
					obj_mainmenu.frame = 0;
					audio_play_sound(snd_shoot,0,0);
					var oldpalette = global.palette;
					while (global.palette == oldpalette) {
						global.palette = irandom(PALETTES-1);
					}
				}
			}
		}
	}
}
}
