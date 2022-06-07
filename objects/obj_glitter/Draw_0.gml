
if (instance_number(obj_surface) > 0 &&  surface_exists(obj_surface.surf)) {
	surface_set_target(obj_surface.surf);
	//var _color = irandom(4) ? color : global.fgcolor2;
	//gpu_set_blendmode(bm_add);
	var _color = image_blend;
	draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,image_yscale,image_angle,_color,image_alpha);
	//gpu_set_blendmode(bm_normal);
	surface_reset_target();
	
}
//gpu_set_blendmode(bm_add);
draw_self();
//gpu_set_blendmode(bm_normal);