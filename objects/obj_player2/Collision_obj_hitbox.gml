/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if (object_exists(obj_player4)) {
	if (other.team != team && (collision_line(x, y, other.x, other.y, obj_wall, false, false) == noone || other.object_index == obj_wallbang))  {
		if (state == status.parry) {
		} else if (invul <= 0) {
			if (deaths + obj_player4.deaths == global.firstto) {
				if (global.hitstop < 120) global.hitstop = 120;
				ultradies = audio_play_sound(snd_dies, 1, false);
				audio_sound_pitch(ultradies, 20/120);
			}
		}
	}
}
