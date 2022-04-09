/// @description Insert description here
// You can write your code in this editor

shotcount = 5;

pads = "";
for (var p = 0; p < PLAYERS; p++;) {
		for (var i = 0; i < global.gpnum; i++;) {
		if ((global.pressed[p][input.U] && i == p)
		|| (gamepad_button_check_pressed(i, gp_padu) && global.gp[i] == p))
		{
			global.shots[p]--;
		}
		if ((global.pressed[p][input.D] && i == p)
		|| (gamepad_button_check_pressed(i, gp_padd) && global.gp[i] == p))
		{
			global.shots[p]++;
		}
		if ((global.pressed[p][input.ST] && i == p)
		|| (gamepad_button_check_pressed(i, gp_start) && global.gp[i] == p))
		{
			room_goto_next();
		}

	}
	if (global.shots[p] < 0) global.shots[p] += shotcount;
	global.shots[p] = global.shots[p] mod shotcount;
	pads += "P" + string(p) + " shot: " + string(global.shots[p]) + "\n";
}






