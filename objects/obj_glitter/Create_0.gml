/// @description Insert description here
// You can write your code in this editor

timer = 10;
scale = 1;
color = global.textcolor;
rng = true;
deathglitter = -1;

drawself = function(scale2 = 1) {
	var _scale = image_xscale * scale2;
	if (sprite_index == spr_glitter) {
		var dx = min(image_index,4) * _scale;
		var dy = clamp(image_index-4,0,4) * _scale;
		var _wid = max(1,_scale);
		draw_line_width(x-dx, y-dy, x-dy, y-dx, _wid);
		draw_line_width(x+dy, y-dx, x+dx, y-dy, _wid);
		draw_line_width(x+dx, y+dy, x+dy, y+dx, _wid);
		draw_line_width(x-dy, y+dx, x-dx, y+dy, _wid);
	} else {
		var dx = clamp(-abs(image_index-4)+4,0,4) * _scale;
		draw_primitive_begin(pr_trianglestrip);
		draw_vertex(x-dx,y);
		draw_vertex(x,y-dx);
		draw_vertex(x+dx,y);
		draw_vertex(x,y+dx);
		draw_vertex(x-dx,y);
		draw_primitive_end();
	}
}