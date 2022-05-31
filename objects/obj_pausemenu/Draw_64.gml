var width   = camera_get_view_width(0);
var height  = camera_get_view_height(0);
var xcenter =  width/2;
var ycenter = height/2;
var outline = 3;
var margin = 16;

draw_set_font(Font1);
draw_set_alpha(1);
var teamcolor = team < 4 ? global.color[team] : global.fgcolor2;
draw_set_color(teamcolor);


draw_set_valign(fa_top);
draw_set_halign(fa_center);

var teamstr;

if (global.mode == gamemode.teamvs) {
	switch team {
		case 0: teamstr = "2"; break;
		case 1: teamstr = "3"; break;
		case 2: teamstr = "1"; break;
		case 3: teamstr = "4"; break;
	}
} else {
	teamstr = string(team+1);
}

draw_text(xcenter,128,"Player " + teamstr + " Paused");
draw_set_font(fnt_pause);

var lineheight = string_height("STRING HEIGHT");
var linewidth = string_width("Resume Game");

var ydraw = ycenter;

var dx =         linewidth/2 + margin + outline;
var dy = o_len * lineheight  + margin + outline;
draw_rectangle(xcenter-dx,ydraw-margin-outline,xcenter+dx,ydraw+dy,0);

draw_set_color(global.bgcolor);
var dx =         linewidth/2 + margin;
var dy = o_len * lineheight  + margin;
draw_rectangle(xcenter-dx,ydraw-margin,xcenter+dx,ydraw+dy,0);

draw_set_color(global.fgcolor2);
for (var i = 0; i < o_len; i++) {
	var optionstr = options[i];
	if (i == selected) optionstr = "-" + optionstr + "-";
	draw_text(xcenter, ydraw + i * lineheight, optionstr);
	
}