if (instance_number(obj_surface) > 0 &&  surface_exists(obj_surface.surf)) {
	if (
	collision_point(bbox_left,bbox_top,obj_wall,0,0) &&
	collision_point(bbox_left,bbox_bottom,obj_wall,0,0) &&
	collision_point(bbox_right,bbox_top,obj_wall,0,0) &&
	collision_point(bbox_right,bbox_bottom,obj_wall,0,0)
	) {
		surface_set_target(obj_surface.surf);
		//var _color = irandom(4) ? color : global.fgcolor2;
		var _color = image_blend;
		draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,image_yscale,image_angle,_color,image_alpha);
		surface_reset_target();
	}
}
draw_self();
