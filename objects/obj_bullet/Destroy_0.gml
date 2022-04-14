audio_play_sound(snd_land, 0, 0);

boom = instance_create_layer(x, y, "Trails", obj_boom);
boom.image_xscale = image_xscale;
boom.image_yscale = image_yscale;
boom.image_angle = image_angle;
