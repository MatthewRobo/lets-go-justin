if (!surface_exists(surf)) {
	surf = surface_create(room_width,room_height);
}
if (!surface_exists(splatter)) {
	splatter = surface_create(room_width,room_height);
}
if (!surface_exists(glitter)) {
	glitter = surface_create(room_width,room_height);
}
if (!surface_exists(scanline)) {
	scanline = surface_create(room_width,room_height);
	do_scanline = true;
}
if (!surface_exists(mask)) {
	mask = surface_create(room_width,room_height);
	do_mask = true;
}

if (!surface_exists(death_log)) {
	death_log = surface_create(room_width,room_height);
	surface_set_target(death_log);
	draw_set_color(c_grey);
	draw_set_alpha(1);
	with (obj_wall) {
		draw_rectangle(bbox_left,bbox_top,bbox_right,bbox_bottom,0);
	}
	surface_reset_target();
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
draw_clear_alpha(0,0);
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

surface_set_target(glitter);

gpu_set_blendmode_ext(bm_one,bm_inv_src_color);
//gpu_set_blendmode(bm_add);
with(obj_glitter) {
	if (deathglitter != -1) {
		draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,image_yscale,image_angle,deathglitter,image_alpha * 0.1);
	}
}
gpu_set_blendmode(bm_subtract);
draw_set_color(c_black);
draw_surface(scanline,0,-1);
with(obj_outline) {
	
	var z0 = w0 * 2;
	var _z0 = _w0 * 2;
	draw_primitive_begin(pr_trianglestrip);
	draw_vertex(round(x11-z0),round(y11-z0));
	draw_vertex(round(x21+z0),round(y12-z0));
	draw_vertex(round(x12-z0),round(y21+z0));
	draw_vertex(round(x22+z0),round(y22+z0));
	draw_primitive_end();

	draw_rectangle(round(x1-_z0),
	               round(y1-_z0),
	               round(x2+_z0),
	               round(y2+_z0), 0);
}


//draw_set_alpha(0.01);
//draw_rectangle(0,0,room_width,room_height,0);
gpu_set_blendmode(bm_normal);
surface_reset_target();

draw_set_alpha(1);
draw_surface(surf,0,0);
draw_surface(splatter,0,0);
draw_surface(glitter,0,0);

surface_set_target(death_log);
draw_set_alpha(0.5);
with(obj_player) {
	if (dead && global.hitstop == 1) {
		var _color;
		switch team {
			case 0: _color = c_red; break;
			case 1: _color = c_blue; break;
			case 2: _color = c_yellow; break;
			case 3: _color = c_aqua; break;
		}
		draw_set_color(_color);
		draw_circle(x,y,16,false);
		draw_line(x,y,killer_x,killer_y);
	}
}
surface_reset_target();