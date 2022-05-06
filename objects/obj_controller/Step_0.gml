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

if (start) quit+=1/45;
else quit-=1/45;
if (select) restart+=1/45;
else restart -=1/45;

if (quit < 0) quit = 0;
if (restart < 0) restart = 0;

if (restart > 1) {
	room_restart();
}
if (quit > 1) {
	room_goto(global.mode == gamemode.training ? Room_Select : Pad_Select);
}

if (global.pmax == 4) {
	if (obj_player1.deaths + obj_player3.deaths >= global.firstto) {
		someonewon = true;
	}

	if (obj_player2.deaths + obj_player4.deaths >= global.firstto) {
		someonewon = true;
	}
} else {
	if (obj_player1.deaths == global.firstto) && (obj_player2.deaths == global.firstto)
	&& obj_player1.dead && obj_player2.dead {
		global.firstto+=2;
		someonewon = false;
	} else {
		if (obj_player1.deaths >= global.firstto) {
			someonewon = true;
		}
		if (obj_player2.deaths >= global.firstto) {
			someonewon = true;
		}
	}

}


roundstart--;
if (roundstart == 0) audio_play_sound(snd_spawn,0,0);
if (global.hitstop <= 0 && roundstart <= 0 && !someonewon) totalframes++;
seconds = totalframes div 60;

roundratio = 1-(roundstart/roundinit);
