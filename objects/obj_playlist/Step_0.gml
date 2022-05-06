global.musicgain = clamp(global.musicgain,0,11);
if (!someonewon) audio_sound_gain(nowplaying,global.musicgain/10,0);


if (inbattle) {
	if (!someonewon && obj_controller.someonewon) {
		audio_sound_gain(nowplaying,0,0);
		audio_sound_gain(nowplaying,global.musicgain/10,2000);
		someonewon = true;
	}
}
