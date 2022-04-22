/// @description Insert description here
// You can write your code in this editor

if (global.hitstop > 0) {
	global.hitstop --;
}

start = false;
select = false;
for (var i = 0; i < GP+KB; i++;)
{

	if gamepad_button_check(i, gp_start) 
	|| keyboard_check(vk_enter) 
	|| keyboard_check(vk_escape) 
	|| global.down[i][input.ST] {
		start = true;
	} 
	if gamepad_button_check(i, gp_select) 
	|| keyboard_check(vk_backspace)
	|| global.down[i][input.SE] {
		select = true;
	}
	
	if (global.mode == gamemode.training) {
		if (global.pressed[i][input.SE]) {
			room_restart();
		}
	}
}

if (start) quit++;
else quit = 0;
if (select) restart++;
else restart = 0;

if (restart > 45) {
	room_restart();
}
if (quit > 45) {
	room_goto(Pad_Select);
}




roundstart--;
if (roundstart == 0) audio_play_sound(snd_spawn,0,0);

