/// @description Insert description here
// You can write your code in this editor

randomize();

roundinit = 80;
roundstart = roundinit;
roundratio = 0;
global.hitstop = 0;
restart = 0;
quit = 0;
global.firstto = global.pmax == 4 ? 24 : 12;
if (global.mode == gamemode.training) {
	roundstart = 0;
	global.firstto = -1;
}

audio_play_sound(snd_dies,0,0);

instance_destroy(obj_thingy);

global.outline = c_green;
bgid = layer_background_get_id("Background"); 
layer_background_blend(bgid, global.bgcolor);

takess = GREYBOX;

totalframes = 0;
seconds = totalframes div 60;
frames = totalframes mod 60;
ms = frames / 60 * 10;

instance_create_depth(room_width/2,room_height/2,-9999,obj_camera);

someonewon = false;
