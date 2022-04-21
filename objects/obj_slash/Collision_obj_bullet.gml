instance_destroy(other);

if (global.hitstop < 4) global.hitstop = 4;

instance_create_layer(other.x, other.y, "ParryFX", obj_boom); 
