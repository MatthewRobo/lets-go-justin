/// @description Insert description here
// You can write your code in this editor

position = array_create(GP+KB,-99);
ready = array_create(PLAYERS,-99);
for (i = 0; i < PLAYERS; i++) {
	if (global.lookup[i] != GP+KB) {
		position[global.lookup[i]] = i;
	}
}

readypos = array_create(GP+KB, false);



teams = global.mode == gamemode.teamvs;
if (global.pmax == 4) teams = true;


if (global.mode != gamemode.training) audio_play_sound(snd_parry,0,0);


gbid = layer_background_get_id("background");
layer_background_blend(gbid, global.bgcolor);

usinganalogue = false;
