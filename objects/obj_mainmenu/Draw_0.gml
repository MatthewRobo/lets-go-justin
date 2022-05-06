draw_set_alpha(1);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_font(Font1);
var xdraw = room_width / 2;
var lineheight = string_height("Single Versus");

var ydrawlerp = 512 + 6 + selectedlerp*(lineheight+12);
draw_set_color(global.fgcolor2);
draw_rectangle(0,ydrawlerp-lineheight/2-3,room_width,ydrawlerp+lineheight/2+3,0);
draw_set_color(global.fgcolor);
draw_rectangle(0,ydrawlerp-lineheight/2,room_width,ydrawlerp+lineheight/2,0);

var distfromteam = 1-abs(1-selectedlerp);
//draw_set_alpha(distfromteam);

draw_set_color(global.color[2]);
draw_rectangle(xgap,ydrawlerp-lineheight/2+pgap,xgap+distfromteam*(xwid),ydrawlerp+lineheight/2-pgap,0);
draw_set_color(global.color[3]);
draw_rectangle(room_width-(xgap+distfromteam*(xwid)),ydrawlerp-lineheight/2+pgap,room_width-xgap,ydrawlerp+lineheight/2-pgap,0);

draw_set_alpha(1);

draw_set_color(global.color[0]);
draw_rectangle(xgap+distfromteam*(xwid+xgap),ydrawlerp-lineheight/2+pgap,xgap+xwid+distfromteam*(xgap+xwid),ydrawlerp+lineheight/2-pgap,0);
draw_set_color(global.color[1]);
draw_rectangle(room_width-(xgap+xwid+distfromteam*(xgap+xwid)),ydrawlerp-lineheight/2+pgap,room_width-(xgap+distfromteam*(xwid+xgap)),ydrawlerp+lineheight/2-pgap,0);


for (var i = 0; i < modelen; i++) {
	
	var ydraw = 512 + i * (lineheight + 12);
	draw_set_color(global.fgcolor2);
	ydraw+=8;
	draw_text(xdraw,ydraw,modestr[i]);
}

draw_sprite_ext(spr_logo,0,xdraw,64,3,3,0,global.fgcolor2,1);

