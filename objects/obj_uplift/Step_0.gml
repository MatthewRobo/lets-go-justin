if !GREYBOX {

repeat(3) {
	trail = instance_create_layer(x, y, "trails", obj_glitter);
	trail.image_blend = irandom(1) ? c_white : global.fgcolor2;
	if (irandom(1)) trail.sprite_index = spr_blob;
	trail.x = random_range(bbox_left, bbox_right);
	trail.y = random_range(bbox_bottom, bbox_top);
	//trail.scale  = random_range(1,1.2);
}
}

