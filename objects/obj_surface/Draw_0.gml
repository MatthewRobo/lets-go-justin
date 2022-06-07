if (!surface_exists(surf)) {
	surf = surface_create(room_width,room_height);
}
if (!surface_exists(surf2)) {
	surf2 = surface_create(room_width,room_height);
	do_scanline = true;
}
if (!surface_exists(mask)) {
	mask = surface_create(room_width,room_height);
	do_mask = true;
}


if (do_scanline) {
	
	if (surface_exists(surf2)) {
		surface_set_target(surf2);
		draw_set_alpha(1);
		draw_set_color(global.fgcolor);
		//draw_set_color(c_fuchsia);
		for (var i = 0; i < room_height; i++) {
			if (i mod 2) draw_line(0,i,room_width,i);
		}
	
		surface_reset_target();
	}
	surface_save(surf2, "surf2.png");
	do_scanline = false;
}

if (do_mask) {
	if (surface_exists(obj_surface.mask)) {
		surface_set_target(obj_surface.mask);
		draw_clear_alpha(c_black,1);
		surface_reset_target();
	}
	with (obj_wall) {
		if (surface_exists(obj_surface.mask)) {
			surface_set_target(obj_surface.mask);
			gpu_set_blendmode(bm_subtract);
			draw_set_color(c_black);
			draw_set_alpha(1);
			draw_rectangle(bbox_left,bbox_top,bbox_right,bbox_bottom,0);
			gpu_set_blendmode(bm_normal);
			surface_reset_target();
		}
	}

	//surface_set_target(obj_surface.mask);
	//draw_set_alpha(1);
	//draw_set_color(c_black);
	//for (var i = 0; i < room_width; i++) {
	//	for (var j = 0; j < room_height; j++) {
	//		if (!position_meeting(i,j,obj_wall)) {
				
	//			draw_point(i,j);
	//		}
	//	}
	//}
	//surface_reset_target();
	do_mask = false;
}

surface_set_target(surf);
draw_surface_ext(surf2,0,0,1,1,0,c_white,0.005);
gpu_set_blendmode(bm_subtract);
draw_surface(mask,0,0);
gpu_set_blendmode(bm_normal);
surface_reset_target();
draw_surface(surf,0,0);
