instance_destroy();

if (global.hitstop < 4) global.hitstop = 4;

instance_create_layer(x, y, "ParryFX", obj_boom); 
