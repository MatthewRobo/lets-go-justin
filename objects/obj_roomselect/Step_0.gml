/// @description Insert description here
// You can write your code in this editor



for (var p = 0; p < PLAYERS; p++;) {
		for (var i = 0; i < global.gpnum; i++;) {
		if ((global.pressed[p][input.L] && i == p)
		|| (gamepad_button_check_pressed(i, gp_padl) && global.gp[i] == p))
		{
			room_goto(Room1);
		}
		if ((global.pressed[p][input.U] && i == p)
		|| (gamepad_button_check_pressed(i, gp_padu) && global.gp[i] == p))
		{
			room_goto(Room2);
		}
		if ((global.pressed[p][input.D] && i == p)
		|| (gamepad_button_check_pressed(i, gp_padd) && global.gp[i] == p))
		{
			room_goto(Room3);
		}
		if ((global.pressed[p][input.R] && i == p)
		|| (gamepad_button_check_pressed(i, gp_padr) && global.gp[i] == p))
		{
			room_goto(Room4);
		}
	}
}


