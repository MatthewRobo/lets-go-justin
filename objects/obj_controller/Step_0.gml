/// @description Insert description here
// You can write your code in this editor

if (global.hitstop >= 0) {
	global.hitstop --;
}

start = false;
select = false;
for (var i = 0; i < global.gpnum; i++;)
{

	if gamepad_button_check(i, gp_start) {
		start = true;
	} 
	if gamepad_button_check(i, gp_select) {
		select = true;
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
