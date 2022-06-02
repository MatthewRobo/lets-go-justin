if (!surface_exists(surf)) {
	surf = surface_create(room_width,room_height);
}
if (!surface_exists(surf2)) {
	surf2 = surface_create(room_width,room_height);
	do_scanline = true;
}


if (do_scanline) {
		with (obj_wall) {
		if (surface_exists(obj_surface.surf2)) {
			surface_set_target(obj_surface.surf2);
			for (var i = bbox_top; i <= bbox_bottom; i++) {
				if (i mod 2 == 0){
					draw_line(bbox_left,i,bbox_right,i);
				}
			}
			surface_reset_target();
		}
	}
	surface_save(surf2, "surf2.png");
	do_scanline = false;
}

surface_set_target(surf);
draw_surface_ext(surf2,0,0,1,1,0,c_white,0.005);
surface_reset_target();
draw_surface(surf,0,0);
