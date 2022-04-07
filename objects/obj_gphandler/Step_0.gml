/// @description Insert description here
// You can write your code in this editor

pads = "";

var gp_num = gamepad_get_device_count();
for (var i = 0; i < gp_num; i++;)
{
	if gamepad_is_connected(i) {
		pads += string(global.gp[i]) + "\n";
	} 
	
}


