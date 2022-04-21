/// @description Insert description here
// You can write your code in this editor

ready = array_create(PLAYERS,false);
cols = 3;
rows = shot.length div cols + 1;


gbid = layer_background_get_id("background");
layer_background_blend(gbid, global.bgcolor);
