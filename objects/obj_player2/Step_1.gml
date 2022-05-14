/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if (global.mode = gamemode.training) {
	for (var i = 0; i < GP+KB; i++;)
	{
		if global.pressed[i][input.ST] && global.lookup[0] != i {
			global.lookup[team] = i;
			if (i != gamepad) audio_play_sound(snd_parry,0,0);
			gamepad = global.lookup[team];
		}
	}
	
	if (dummyparry) {
		nearby = instance_nearest(x, y, obj_hitbox);
		if (nearby != noone) {
			dist = point_distance(x, y, nearby.x, nearby.y);
			aprad = 32 + point_distance(0,0,nearby.hsp,nearby.vsp) * 2;
		
			if (dist <= aprad) parry = true;
		}
		state = status.parry;
	}
	if (dummyinvul) invul++;
}
