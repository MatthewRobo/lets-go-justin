var width  = display_get_gui_width();
var height = display_get_gui_height();

var xcenter = width/2;
var ycenter = height/2;

var scale = 1/8;
var xoffset = (room_width/2)*scale;
var yoffset = (room_height/2)*scale;

draw_surface_ext(minimap,xcenter-xoffset,height-yoffset*2-24,scale,scale,0,c_white,1);