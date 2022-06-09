/// @description Insert description here
// You can write your code in this editor

draw_set_font(fnt_mono);
draw_set_color(global.textcolor);
draw_set_halign(fa_left);
draw_set_valign(fa_bottom);
draw_text(0,display_get_gui_height(),string(fps));

