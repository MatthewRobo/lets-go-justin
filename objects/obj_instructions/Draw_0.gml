/// @description Insert description here
// You can write your code in this editor
draw_self();
text = "Hold start to continue";
draw_set_font(Font1);
draw_set_halign(fa_center);
draw_set_valign(fa_bottom);

draw_set_color(global.fgcolor2);

var _x = lerp(-pi,pi,timer);
var _e = 2.718281828459;
var _ans = (power(_e, 2*_x)-1)/(power(_e, 2*_x)+1);
//draw_rectangle(0, room_height - 16, 0.5*(dsin(timer * 180 + 270)+1) * room_width, room_height,0);
draw_rectangle(0, room_height - 16,(_ans*1.005+1)/2*room_width, room_height,0);
draw_text(room_width/2,room_height - 16,text);
