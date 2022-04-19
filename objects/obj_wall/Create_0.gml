/// @description Insert description here
// You can write your code in this editor

outline = instance_create_depth(x,y,depth+2,obj_outline);
outline.w0 = 2;
outline.x1 = bbox_left;
outline.x2 = bbox_right;
outline.y1 = bbox_top;
outline.y2 = bbox_bottom;

/// @description Insert description here
// You can write your code in this editor

image_blend = c_black;

outline._x1 = bbox_left;
outline._x2 = bbox_right;
outline._y1 = bbox_top;
outline._y2 = bbox_bottom;
outline.x11 = bbox_left;
outline.x21 = bbox_right;
outline.y11 = bbox_top;
outline.y21 = bbox_bottom;
outline.x12 = bbox_left;
outline.x22 = bbox_right;
outline.y12 = bbox_top;
outline.y22 = bbox_bottom;

/*
timer = 0;
glitterspawn = (sprite_height * sprite_width) / 16384;
*/
