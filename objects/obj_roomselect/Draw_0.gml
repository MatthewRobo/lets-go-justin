draw_set_color(global.fgcolor2);
draw_set_alpha(1);
mode = "";

switch global.mode {
	case gamemode.versus:
		mode = "Single Versus";
		break;
	case gamemode.teamvs:
		mode = "Team Versus";
		break;
	case gamemode.training:
		mode = "Training Mode";
		break;
}

draw_set_halign(fa_center);
draw_set_valign(fa_top);
draw_set_font(Font1);
draw_text(room_width/2,20,mode);

draw_set_alpha(1);

draw_set_font(fnt_tiny);

//draw_text(room_width/2,room_height/2,rooms[selected]);
for (var i = -roomlen; i < 2 * roomlen; i++) {
	var imod = (i + roomlen) mod roomlen;
	var xdraw = room_width / 2 + (i - selectedlerp) * (prevsize + prevgap);
	var xdraw_large = room_width / 2 + (i - selectedlerp) * (zoomsize + zoomgap);
	//if (imod == 0) {
	//	draw_set_font(Font1);
	//	draw_text_color(xdraw,ydraw,"Random",global.fgcolor2,global.fgcolor2,global.fgcolor2,global.fgcolor2,selected == i ? 1 : 0.5);
	//	draw_set_font(fnt_large);
	//	draw_text_color(xdraw_large,ydraw_large,"Random",c_white,c_white,c_white,c_white,1);
	//}

	if (imod >= array_length(previews)) imod = 0;
	var _ydraw = ydraw + banlerp[imod] * 25;
	var banalpha = 1-0.7*banlerp[imod];
	var _alpha = selected == i ? 1 : 0.6;
	_alpha *= banalpha;
	draw_text_color(xdraw,_ydraw-64,roomstr[imod],global.fgcolor2,global.fgcolor2,global.fgcolor2,global.fgcolor2,_alpha);
	draw_sprite_ext(previews[imod],0,xdraw,_ydraw,prevscale,prevscale,0,global.fgcolor2,_alpha); 
	draw_sprite_ext(previews[imod],0,xdraw_large,ydraw_large,zoomscale,zoomscale,0,c_white,_alpha); 
}

var gap = 3;
draw_set_font(fnt_prompt);
draw_set_valign(fa_bottom);
draw_set_halign(fa_right);
var prompt = "Press down to ban | Press up to unban | F4/down + 3 buttons to rebind | Press Start/[A] to confirm | Press Select/[B] to cancel";
draw_rectangle(room_width-string_width(prompt)-gap*2,room_height-string_height(prompt)-gap,room_width,room_height,0);
draw_set_color(global.bgcolor);
draw_text(room_width-gap,room_height,prompt);


draw_set_color(global.fgcolor2);
draw_set_valign(fa_top);
var designer = "Level design by ";
switch selected {
	case 1: case 5: case 6: case 8: designer += "M-AS (@matthewrobo)"; break;
	case 0: designer += "??? (@???)"; break;
	case 7: designer += "M-AS (@matthewrobo) & Jorge Velasquez (@Gorka_Man)"; break;
	case 13: designer += "Irregulars (@IrregularsZR)"; break;
	default: designer += "Jorge Velasquez (@Gorka_Man)"; break;
}
draw_text(room_width-gap,gap,designer);
