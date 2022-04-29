draw_set_color(global.fgcolor2);
draw_set_alpha(1);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);


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

	var xdraw_large = room_width / 2 + (i - selectedlerp) * (zoomsize + zoomgap);
	if (imod >= array_length(previews)) imod = 0;
	draw_sprite_ext(previews[imod],0,xdraw,ydraw,prevscale,prevscale,0,global.fgcolor2,selected == i ? 1 : 0.6); 
	draw_sprite_ext(previews[imod],0,xdraw_large,ydraw_large,zoomscale,zoomscale,0,c_white,1); 
}
