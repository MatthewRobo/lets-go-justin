if (!surface_exists(surf)) {
	surf = surface_create(room_width,room_height);
}

with (obj_wall) {
	if (surface_exists(obj_surface.surf)) {
		surface_set_target(obj_surface.surf);
		draw_set_alpha(0.004);
		//draw_rectangle(bbox_left,bbox_top,bbox_right,bbox_bottom,0);
		for (var i = bbox_top; i < bbox_bottom; i++) {
			if (i mod 2 == 0) {
						draw_set_alpha(0.004);
				draw_line(bbox_left,i,bbox_right,i);
			} 
		}
		surface_reset_target();
		draw_set_alpha(1);
	}
}

draw_surface(surf,0,0);
