/// @description Insert description here
// You can write your code in this editor

text = "Hold start to continue";
draw_set_font(Font1);
draw_set_halign(fa_center);
draw_set_valign(fa_bottom);

draw_set_color(global.fgcolor2);
draw_rectangle(0, room_height - 16, timer * room_width, room_height,0);
draw_text(room_width/2,room_height - 16,text);
