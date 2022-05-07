draw_set_alpha(1);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_font(Font1);
var xdraw = room_width / 2;
var lineheight = string_height("Single Versus");
var logoscale = lerp(5.5,3,openlerp);
var logooffset = lerp(140,64,openlerp);
draw_sprite_ext(spr_logo,0,xdraw,logooffset,logoscale,logoscale,0,global.fgcolor2,1);
var yoffset = lerp(room_height-ybegin+28,0,openlerp);

var ydrawlerp = yoffset + ybegin + 6 + selectedlerp*(lineheight+12);
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
draw_rectangle(xgap+distfromteam*(xwid+xgap),ydrawlerp-lineheight/2+pgap,xgap+xwid+1*(xgap+xwid),ydrawlerp+lineheight/2-pgap,0);
draw_set_color(global.color[1]);
draw_rectangle(room_width-(xgap+xwid+1*(xgap+xwid)),ydrawlerp-lineheight/2+pgap,room_width-(xgap+distfromteam*(xwid+xgap)),ydrawlerp+lineheight/2-pgap,0);

draw_set_color(global.fgcolor2);
for (var i = 0; i < modelen; i++) {
	
	var ydraw = yoffset + ybegin + i * (lineheight + 12);
	ydraw+=8;
	draw_text(xdraw,ydraw,modestr[i]);
}


var gap = 3;
draw_set_font(fnt_prompt);
draw_set_valign(fa_bottom);
draw_set_halign(fa_right);
var prompt = "";
if (global.mode = -2 && global.musicgain > 0) prompt += "I DO NOT OWN ANY OF THESE MENU THEMES OR BATTLE THEMES\nThe music is just here to give an idea of what the game should sound like | These tracks will not be in the final game\n";
prompt += "Press F4 (keyboard) or down + any three buttons (controller) to rebind controls | Press Start/[A] to confirm | Press Select/[B] to cancel";
draw_rectangle(room_width-string_width(prompt)-gap*2,room_height-string_height(prompt)-gap,room_width,room_height,0);
draw_set_color(global.bgcolor);
draw_text(room_width-gap,room_height,prompt);
