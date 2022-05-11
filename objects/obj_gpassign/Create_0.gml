/// @description Insert description here
// You can write your code in this editor

teams = global.mode == gamemode.teamvs;
position = array_create(GP+KB,-99);
ypos = array_create(GP+KB,-99);
ready = array_create(PLAYERS,-99);
for (var i = 0; i < PLAYERS; i++) {
	if (global.lookup[i] != GP+KB) {
		position[global.lookup[i]] = i;
		if (!teams && i > 1) {
			position[global.lookup[i]] = -1;
		}
	}
}

readypos = array_create(GP+KB, false);
if (global.mode != gamemode.training) audio_play_sound(snd_parry,0,0);


gbid = layer_background_get_id("background");
layer_background_blend(gbid, global.bgcolor);

usinganalogue = false;

posdraw = array_create(GP+KB,0);
lerpfactor = 0.4;

start = 0;
