if (!surface_exists(surf)) {
	surf = surface_create(room_width,room_height);
}
if (!surface_exists(splatter)) {
	splatter = surface_create(room_width,room_height);
}
if (!surface_exists(scanline)) {
	scanline = surface_create(room_width,room_height);
	do_scanline = true;
}
if (!surface_exists(mask)) {
	mask = surface_create(room_width,room_height);
	do_mask = true;
}

if (do_scanline) {
	draw_set_alpha(1);
	draw_set_color(c_white);
	surface_set_target(scanline);
	for (var i = 0; i < room_height; i+= 2) {
		draw_line(0,i,room_width,i);
	}
	
	surface_reset_target();
	surface_save(scanline, "scanline.png");
	do_scanline = false;
}

if (do_mask) {
	surface_set_target(obj_surface.mask);
	draw_clear_alpha(c_black,1);

	gpu_set_blendmode(bm_subtract);
	draw_set_color(c_black);
	draw_set_alpha(1);
	with (obj_wall) {
		draw_rectangle(bbox_left,bbox_top,bbox_right,bbox_bottom,0);
	}

	gpu_set_blendmode(bm_normal);
	surface_reset_target();
	do_mask = false;
}

surface_set_target(surf);
with(obj_splatter) {
	draw_set_alpha(image_alpha);
	draw_set_color(image_blend);
	draw_circle(x,y,radius/8,false);
}
with(obj_glitter) {
	draw_self();
}
draw_set_alpha(1);
gpu_set_blendmode(bm_subtract);
draw_surface_ext(scanline,0,0,1,1,0,c_black,0.005);
draw_surface(mask,0,0);
gpu_set_blendmode(bm_normal);
surface_reset_target();


surface_set_target(splatter);
draw_clear_alpha(c_black,0);
gpu_set_blendmode(bm_add);
with(obj_splatter) {
	draw_set_alpha(image_alpha);
	draw_set_color(image_blend);
	draw_circle(x,y,radius,false);
}
draw_set_alpha(1);
gpu_set_blendmode(bm_subtract);
draw_surface(scanline,0,-1);
gpu_set_blendmode(bm_normal);
with(obj_splatter) {
	draw_set_color(image_blend);
	draw_circle(x,y,radius,true);
}
surface_reset_target();


draw_surface(surf,0,0);
draw_surface(splatter,0,0);