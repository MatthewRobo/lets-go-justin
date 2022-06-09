
var big, sprite;
sprite = sprite_index;
big = 0;
if (embiggen) {
	sprite = spr_slash;
	big = min(2, global.hitstop * global.hitstop * 0.01);
}
draw_sprite_ext(sprite,image_index,x,y,image_xscale+big,image_yscale+big,image_angle,image_blend,image_alpha);