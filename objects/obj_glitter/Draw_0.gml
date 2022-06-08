//draw_self();

draw_set_alpha(image_alpha);
draw_set_color(image_blend);
var _scale = image_xscale;
if (sprite_index == spr_glitter) {
	var dx = min(image_index,4);
	var dy = clamp(0,image_index-4,4) * _scale;
	var _wid = max(1,_scale);
	draw_line_width(x-dx, y-dy, x-dy, y-dx, _wid);
	draw_line_width(x+dy, y-dx, x+dx, y-dy, _wid);
	draw_line_width(x+dx, y+dy, x+dy, y+dx, _wid);
	draw_line_width(x-dy, y+dx, x-dx, y+dy, _wid);
} else {
	var dx = clamp(-abs(image_index-4)+4,0,4);
	draw_primitive_begin(pr_trianglestrip);
	draw_vertex(x-dx,y);
	draw_vertex(x,y-dx);
	draw_vertex(x+dx,y);
	draw_vertex(x,y+dx);
	draw_vertex(x-dx,y);
	draw_primitive_end();
}