if !GREYBOX {

for (i = 0; i < 3; i++) {
	trail = instance_create_layer(x, y, "trails", obj_glitter);
	trail.image_blend = irandom(1) ? c_white : global.fgcolor2;
	
	trail.x = random_range(bbox_left, bbox_right);
	trail.y = random_range(bbox_bottom, bbox_top);
	trail.scale  = random_range(1,1.2);
}
}

