/// @description Insert description here
// You can write your code in this editor

pads = "";

var gp_num = gamepad_get_device_count();
for (var i = 0; i < gp_num; i++;)
{
	if gamepad_is_connected(i) && global.gp[i] != 0 && global.gp[i] != -99{
		if gamepad_button_check_pressed(i, gp_padl) {
			room_goto(Room1);
		} else if gamepad_button_check_pressed(i, gp_padu) {
			room_goto(Room2);
		} else if gamepad_button_check_pressed(i, gp_padd) {
			room_goto(Room3);
		} else if gamepad_button_check_pressed(i, gp_padr) {
			room_goto(Room4);
		}
	}
}

