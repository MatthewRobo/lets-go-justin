/// @description Insert description here
// You can write your code in this editor

shotcount = 3;

for (var i = 0; i < global.gpnum; i++;)
{
	if gamepad_button_check_pressed(i, gp_padu)
	{
		if (global.gp[i] == 1) global.p2shot = (global.p2shot - 1);
		else if (global.gp[i] == -1) global.p1shot = (global.p1shot - 1);
	}
	if gamepad_button_check_pressed(i, gp_padd) {
		if (global.gp[i] == 1) global.p2shot = (global.p2shot + 1);
		else if (global.gp[i] == -1) global.p1shot = (global.p1shot + 1);
	}
	if gamepad_button_check_pressed(i, gp_start) || keyboard_check_pressed(vk_enter) {
		room_goto_next();
	}
}

if (global.p1shot < 0) global.p1shot += shotcount;
global.p1shot = global.p1shot mod shotcount;
if (global.p2shot < 0) global.p2shot += shotcount;
global.p2shot = global.p2shot mod shotcount;

pads = "P1 shot: " + string(global.p1shot) + "\nP2 shot: " + string(global.p2shot);
