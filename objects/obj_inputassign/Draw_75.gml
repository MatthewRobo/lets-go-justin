/// @description Insert description here
// You can write your code in this editor

draw_set_font(fnt_mono);
draw_set_valign(fa_top);


var lineheight = string_height("abcdefghijkABCDEFTHIJK");
var ydraw = 10;
var ydraw_final = ydraw + 14 * lineheight;
draw_set_color(c_black);
draw_set_alpha(0.5);
draw_rectangle(0,0,room_width,ydraw_final,0);

for (var p = 0; p < 2; p++) {
	draw_set_alpha(1);
	var ydraw = 10;
	if (p == 0) {
		draw_set_halign(fa_left);
		var xdraw = 10;
	} else {
		draw_set_halign(fa_right);
		var xdraw = room_width -10;
	}
	draw_set_color(c_white);
	var device = global.lookup[p];
	draw_text(xdraw,ydraw,device);
	ydraw += lineheight;
	for (var a = 0; a < total_options; a++) {
		switch a {
			case input.L:  k = "Left"; break;
			case input.D:  k = "Down"; break;
			case input.U:  k = "Up"; break;
			case input.R:  k = "Right"; break;
			case input.ST: k = "Start"; break;
			case input.SE: k = "Select"; break;
			case input.JU: k = "Jump"; break;
			case input.SL: k = "A"; break;
			case input.SH: k = "B"; break;
			case input.PA: k = "C"; break;
			case 10: k = "Done (press any ";
				if (device < GP) k += "button)";
				else k += "key)";
				break;
			case 11:
				k = "Reset to default (press ";
				k += device >= GP ? "F" : "any button)";
				if (device == GP) k += "1)";
				if (device == GP+1) k += "2)";
				if (device == GP+KB) k += "1/F2)";
				break;
		}
		if (a < input.length) {
			bind = global.mainbind[global.lookup[p]][a];
			bindstr = key_to_string(bind);
			k += " : " + bindstr;

		}
		draw_set_color(c_white);
		draw_set_alpha(1);
		if (a == pos[p]) {
			draw_set_color(c_red);
			if (device == GP || device == GP + 1) {
				if (pos[p] < 4) k += binding[p] ? " (Press new key)" : " (Press start to bind)";
			} else {
				if (pos[p] < 4) k += " (Can't rebind movement on controllers)";
			}
			if (a == input.SH) k += " (shoot)";
			if (a == input.SL) k += " (slash)";
			if (a == input.PA) k += " (parry)";
		}
		if (global.lookup[p] < GP && a < 4) {
			draw_set_alpha(0.75);
		}

		if (ready[p]) draw_set_color(c_aqua);
		if (device == GP+KB) draw_set_alpha(0);
		draw_text(xdraw,ydraw,k);
		ydraw += lineheight;
	}
}
