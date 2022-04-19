/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

image_xscale = -1 * scale;
team = 1;

spr_idle = spr_p2idle;
spr_empty = spr_p2empty;
spr_parry = spr_p2parry;
spr_recovery = spr_p2recovery;

teamstr = "2";

if (global.mode = gamemode.training) {
	spr_idle = spr_p3idle;
	spr_empty = spr_p3empty;
	spr_parry = spr_p3parry;
	spr_recovery = spr_p3recovery;
}

autoparry = false;
aprad = 60;
