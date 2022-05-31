/// @description Insert description here
// You can write your code in this editor

randomize();

roundfreeze = 30;
roundinit = 60*2 + roundfreeze;
roundstart = roundinit;
roundratio = 0;
global.hitstop = 0;
global.laststop = 0;
global.peakstop = 99999;
restart = 0;
start = array_create(GP+KB,0);
quit = 0;
global.firstto = global.pmax == 4 ? 24 : 12;
if (global.mode == gamemode.training) {
	roundstart = 0;
	roundinit = 1;
	roundfreeze = 0;
	global.firstto = -1;
}

audio_play_sound(snd_dies,0,0);

instance_destroy(obj_thingy);

global.outline = global.fgcolor2;
bgid = layer_background_get_id("Background"); 
layer_background_blend(bgid, global.bgcolor);

global.takess = GREYBOX;

totalframes = 0;
seconds = totalframes div 60;
frames = totalframes mod 60;
ms = frames / 60 * 10;

instance_create_depth(room_width/2,room_height/2,-9999,obj_camera);

someonewon = false;
surf = instance_create_layer(x,y,"platforms",obj_surface);
surf.depth--;

totalframes = -roundstart - roundfreeze;