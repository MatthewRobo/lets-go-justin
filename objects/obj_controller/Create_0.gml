/// @description Insert description here
// You can write your code in this editor

randomize();

roundstart = 80;
global.hitstop = 0;
restart = 0;
quit = 0;
global.firstto = 12;

if (global.mode == gamemode.training) {
	roundstart = 0;
	global.firstto = -1;
}

audio_play_sound(snd_dies,0,0);

instance_destroy(obj_glitter2);

global.outline = c_green;
bgid = layer_background_get_id("Background"); 
layer_background_blend(bgid, global.bgcolor);

