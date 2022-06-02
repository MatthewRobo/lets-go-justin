var height = room_height;
var width = room_width;
if (instance_number(obj_camera) > 0) {
	width = camera_get_view_width(0);
	height= camera_get_view_height(0);
}

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

draw_set_font(fnt_pause);

var lineheight = string_height("STRING HEIGHT");
var linewidth = string_width("PALETTE: 99 (LOCKED)");

var ydraw = ycenter/2;
draw_set_color(global.fgcolor2);
var dx =         linewidth/2 + margin + outline;
dx *= openlerp;
var dy = o_len * lineheight  + margin + outline;
draw_rectangle(xcenter-dx,ydraw-margin-outline,xcenter+dx,ydraw+dy,0);

draw_set_color(global.fgcolor);
var dx =         linewidth/2 + margin;
dx *= openlerp;
var dy = o_len * lineheight  + margin;
draw_rectangle(xcenter-dx,ydraw-margin,xcenter+dx,ydraw+dy,0);

draw_set_color(global.fgcolor2);
var dy = selectedlerp * lineheight;
draw_rectangle(xcenter-dx,ydraw+dy,xcenter+dx,ydraw+dy+lineheight,0);

for (var i = 0; i < o_len; i++) {
	var optionstr = options[i];
	draw_set_color(global.fgcolor2);
	if (i == selected) {
		draw_set_color(global.bgcolor);
	}
	draw_text(xcenter, ydraw + i * lineheight + 4, optionstr);

}