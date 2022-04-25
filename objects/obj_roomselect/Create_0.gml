/// @description Insert description here
// You can write your code in this editor



gbid = layer_background_get_id("background");
layer_background_blend(gbid, global.bgcolor);
var lay_id = layer_get_id("Assets");
var spr_id = layer_sprite_get_id(lay_id, "room1prev");
layer_sprite_blend(spr_id, global.fgcolor2);
var spr_id = layer_sprite_get_id(lay_id, "room2prev");
layer_sprite_blend(spr_id, global.fgcolor2);
var spr_id = layer_sprite_get_id(lay_id, "room3prev");
layer_sprite_blend(spr_id, global.fgcolor2);
var spr_id = layer_sprite_get_id(lay_id, "room4prev");
layer_sprite_blend(spr_id, global.fgcolor2);
