/// @description Insert description here
// You can write your code in this editor

draw_set_colour(c_white);
draw_text(0,0,pads);


xdraw = 1366 / 2;
ydraw = 120;

var gp_num = gamepad_get_device_count();
for (var i = 0; i < gp_num; i++;)
{
	if gamepad_is_connected(i) {
		draw_circle(xdraw + 128 * global.gp[i], ydraw, 20,0);
		ydraw += 60;
	}
	
}
