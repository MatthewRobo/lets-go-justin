if (instance_number(obj_surface) > 0 &&  surface_exists(obj_surface.surf)) {
	if (
	collision_point(bbox_left,bbox_top,obj_wall,0,0) &&
	collision_point(bbox_left,bbox_bottom,obj_wall,0,0) &&
	collision_point(bbox_right,bbox_top,obj_wall,0,0) &&
	collision_point(bbox_right,bbox_bottom,obj_wall,0,0)
	) {
		surface_set_target(obj_surface.surf);
		draw_self();
		surface_reset_target();
	}
}
draw_self();
