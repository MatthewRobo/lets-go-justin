draw_set_alpha(1);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_font(fnt_large);
var xdraw = room_width / 2;
var lineheight = string_height("Single Versus");

var roommiddle = room_height/2;


for (var i = 0; i < modelen; i++) {
	
	var ydraw = room_height / 2 + (i - selectedlerp) * (lineheight + prevgap);
	if (i == selected) {
		draw_set_color(global.fgcolor);
		draw_rectangle(0,ydraw-lineheight/2,room_width,ydraw+lineheight/2,0);
	}
	
	draw_set_color(global.fgcolor2);
	ydraw+=8;
	draw_text(xdraw,ydraw,modestr[i]);
}

