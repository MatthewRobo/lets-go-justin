/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

image_xscale = -1 * scale;
team = 1;

spr_idle = spr_p2idle;

teamstr = "2";

if (global.mode = gamemode.training) {
	spr_idle = spr_p3idle;
}

autoparry = false;
aprad = 60;
