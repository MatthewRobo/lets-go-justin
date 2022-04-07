/// @description Insert description here
// You can write your code in this editor

outline = instance_create_depth(x,y,depth+2,obj_outline);
w = 2;
outline.x1 = bbox_left - w;
outline.x2 = bbox_right + w;
outline.y1 = bbox_top - w;
outline.y2 = bbox_bottom + w;
