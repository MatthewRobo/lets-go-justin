var width = display_get_gui_width();
var height= display_get_gui_height();
var xcenter =  width/2;
var ycenter = height/2;
var outline = 3;
var margin = 16;

draw_set_font(Font1);
draw_set_color(c_black);
draw_set_alpha(alphalerp*0.4);
draw_rectangle(0,0,room_width,room_height,0);

draw_set_alpha(alphalerp);


draw_set_valign(fa_top);
draw_set_halign(fa_center);

var teamstr;



if (team != -1) {
	teamstr = "Player ";
	if (global.mode == gamemode.teamvs) {
		switch team {
			case 0: teamstr += "2"; break;
			case 1: teamstr += "3"; break;
			case 2: teamstr += "1"; break;
			case 3: teamstr += "4"; break;
		}
	} else {
		teamstr += string(team+1);
	}
} else teamstr = "Game";
teamstr += " Paused";
var dx = openlerp * string_width(teamstr) / 2;
var ydraw = ycenter/2;

draw_set_color(color);
draw_rectangle(xcenter - dx-margin, ydraw-margin, xcenter+dx+margin, ydraw+string_height(teamstr)+margin,0);

draw_set_color(global.bgcolor);
draw_text(xcenter,ydraw+4,teamstr);
draw_set_font(fnt_pause);

var lineheight = string_height("STRING HEIGHT");
var linewidth = string_width("Resume Game");

var ydraw = ycenter;
draw_set_color(color);
var dx =         linewidth/2 + margin + outline;
dx *= openlerp;
var dy = o_len * lineheight  + margin + outline;
draw_rectangle(xcenter-dx,ydraw-margin-outline,xcenter+dx,ydraw+dy,0);

draw_set_color(global.fgcolor);
var dx =         linewidth/2 + margin;
dx *= openlerp;
var dy = o_len * lineheight  + margin;
draw_rectangle(xcenter-dx,ydraw-margin,xcenter+dx,ydraw+dy,0);

draw_set_color(global.bgcolor);
var dy = selectedlerp * lineheight;
draw_rectangle(xcenter-dx,ydraw+dy,xcenter+dx,ydraw+dy+lineheight,0);

for (var i = 0; i < o_len; i++) {
	var optionstr = options[i];
	draw_set_color(global.fgcolor2);
	if (i == selected) {
		draw_set_color(color);
	}
	draw_text(xcenter, ydraw + i * lineheight + 4, optionstr);

}