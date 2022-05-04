if !GREYBOX {

for (i = 0; i < 3; i++) {
	trail = instance_create_layer(x, y, "trails", obj_glitter);
	trail.image_blend = irandom(1) ? global.fgcolor : global.fgcolor2;
	
	trail.x = random_range(bbox_left, bbox_right);
	trail.y = random_range(bbox_bottom, bbox_top);
	trail.vspeed -= ((trail.y - bbox_top) / sprite_height) * 2;
	trail.image_xscale  = random_range(1,2);
	trail.image_yscale = trail.image_xscale;
}
}

