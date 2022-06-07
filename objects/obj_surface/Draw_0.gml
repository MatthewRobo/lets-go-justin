if (!surface_exists(surf)) {
	surf = surface_create(room_width,room_height);
}
if (!surface_exists(scanline)) {
	scanline = surface_create(room_width,room_height);
	do_scanline = true;
}
if (!surface_exists(mask)) {
	mask = surface_create(room_width,room_height);
	do_mask = true;
}
if (!surface_exists(splatter)) {
	splatter = surface_create(room_width,room_height);
}
//if (!surface_exists(dot_matrix)) {
//	dot_matrix = surface_create(room_width,room_height);
//	do_dot_matrix = true;
//}


if (do_scanline) {
	
	if (surface_exists(scanline)) {
		surface_set_target(scanline);
		draw_set_alpha(1);
		draw_set_color(global.fgcolor);
		//draw_set_color(c_fuchsia);
		for (var i = 0; i < room_height; i+=2) {
			draw_line(0,i,room_width,i);
		}
	
		surface_reset_target();
	}
	surface_save(scanline, "scanline.png");
	do_scanline = false;
}

//if (do_dot_matrix) {
	

//	surface_set_target(dot_matrix);
//	draw_set_alpha(1);
//	draw_set_color(c_black);
//	for (var i = 0; i < room_width; i += 2) {
//		for (var j = 0; j < room_height; j += 2) {
//			draw_point(i,j);
//			draw_point(i+1,j+1);
//		}
//	}
//	surface_reset_target();
//	do_dot_matrix = false;
//}

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

	do_mask = false;
}

surface_set_target(surf);
draw_surface_ext(scanline,0,0,1,1,0,c_white,0.005);
gpu_set_blendmode(bm_subtract);
draw_surface(mask,0,0);
gpu_set_blendmode(bm_normal);
surface_reset_target();
draw_surface(surf,0,0);

surface_set_target(splatter);
draw_clear_alpha(c_black,0);
gpu_set_blendmode(bm_add);
with(obj_splatter) {
	draw_set_alpha(image_alpha);
	draw_circle_color(x,y,radius,image_blend,image_blend,false);
}
gpu_set_blendmode(bm_normal);
draw_set_alpha(1);
gpu_set_blendmode(bm_subtract);
draw_surface_ext(scanline,0,1,1,1,0,c_black,1);
//draw_surface(dot_matrix,0,0);
gpu_set_blendmode(bm_normal);
with(obj_splatter) {
	draw_circle_color(x,y,radius,image_blend,image_blend,true);
}
surface_reset_target();
draw_surface(splatter,0,0);
