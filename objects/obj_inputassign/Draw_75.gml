/// @description Insert description here
// You can write your code in this editor

draw_set_font(fnt_mono);
draw_set_valign(fa_top);

var height = room_height;
var width = room_width;

if (instance_number(obj_camera) > 0) {
	width = camera_get_view_width(0);
	height= camera_get_view_height(0);
}

var lineheight = string_height("abcdefghijkABCDEFTHIJK");
var ydraw = lineheight;
var ydraw_final = ydraw + 14 * lineheight;
draw_set_color(c_black);
draw_set_alpha(0.6);
draw_rectangle(0,0,width,ydraw_final,0);

has4p = false;
for (var device = 0; device < GP+KB; device++) {
	if (slot[device] == -2 || slot[device] >=2) {
		has4p = true;
	}
}
if (has4p) 
	{
	ydraw = height/2 + lineheight;
	ydraw_final = ydraw + 14 * lineheight;
	draw_rectangle(0,height/2,width,ydraw_final,0);
}

for (var p = 0; p < PLAYERS; p++) {
	draw_set_alpha(1);
	var ydraw = p >= 2 ? height/2 + lineheight : lineheight;
	if (p mod 2 == 0) {
		draw_set_halign(fa_left);
		var xdraw = 10;
	} else {
		draw_set_halign(fa_right);
		var xdraw = width -10;
	}
	draw_set_color(global.textcolor);
	var device = global.lookup[p];
	if (p < 2 || has4p) {
		draw_text(xdraw,ydraw,device_to_string(device));
	}
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
			case input.SL: k = "A (Slash)"; break;
			case input.SH: k = "B (Shoot)"; break;
			case input.PA: k = "C (Parry)"; break;
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
		draw_set_color(global.textcolor);
		draw_set_alpha(1);
		if (device != GP+KB && ready[p]) {
			draw_set_color(global.color[p]);
			if (p mod 2 == 1) draw_rectangle(xdraw-string_width(k),ydraw,xdraw,ydraw+lineheight,0);
			else draw_rectangle(xdraw,ydraw,xdraw+string_width(k),ydraw+lineheight,0);
			draw_set_color(c_black);
		}
		if (a == pos[p]) {
			draw_set_color(global.color[p]);
			if (device == GP || device == GP + 1) {
				if (pos[p] < 4) k += binding[device] ? " (Press new key)" : " (Press start to bind)";
			} else {
				if (pos[p] < 4) k += " (Can't rebind movement on controllers)";
			}
			if (device != GP+KB) {
				if (p mod 2 == 1) draw_rectangle(xdraw-string_width(k),ydraw,xdraw,ydraw+lineheight,0);
				else draw_rectangle(xdraw,ydraw,xdraw+string_width(k),ydraw+lineheight,0);
			}
			//if (a == input.SH) k += " (shoot)";
			//if (a == input.SL) k += " (slash)";
			//if (a == input.PA) k += " (parry)";
			draw_set_color(c_black);
		}
		if (global.lookup[p] < GP && a < 4) {
			draw_set_alpha(0.75);
		}
		
		//if (ready[p]) draw_set_color(c_aqua);
		if (device == GP+KB) draw_set_alpha(0);
		draw_text(xdraw,ydraw,k);
		ydraw += lineheight;
	}
}

ydraw=lineheight;
draw_set_alpha(1);
for (var device = 0; device < GP+KB; device++) {
	draw_set_halign(fa_center);
	draw_set_color(global.textcolor);
	if (slot[device] == -1) {
		draw_text(width/2,ydraw,device_to_string(device));
		ydraw+=lineheight;
	} else if slot[device] == -2 {
		_ydraw = ydraw + height/2;
		draw_text(width/2,_ydraw,device_to_string(device));
		ydraw+=lineheight;
	}

}
