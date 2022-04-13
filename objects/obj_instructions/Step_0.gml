/// @description Insert description here
// You can write your code in this editor

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
		room_goto(Pad_Select);
	} 
}

if (start) timer += 1 / 40;
else timer = 0;

if (timer >= 1) {
	room_goto_next();
	audio_play_sound(snd_parry,0,0);
}
