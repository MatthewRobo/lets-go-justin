draw_set_color(global.fgcolor2);
draw_set_alpha(1);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_font(Font1);

//draw_text(room_width/2,room_height/2,rooms[selected]);
for (var i = -roomlen; i < 2 * roomlen; i++) {
	var imod = (i + roomlen) mod roomlen;
	var ydraw = room_height / 2 + (i - selectedlerp) * (prevh + prevgap);
	if (imod == 0) draw_text(xdraw,ydraw,"Random");

	draw_sprite_ext(previews[imod],0,xdraw,ydraw,prevscale,prevscale,0,global.fgcolor2,1); 
}
