/// @description Insert description here
// You can write your code in this editor

if (other.team != team && other.object_index != obj_parry) {
	if (state == status.parry) {
		invul += 5;
		state = status.idle;
		sprite_index = bullet ? spr_idle : spr_empty;
		spark = instance_create_layer(x, y, "parryfx", obj_parry);
		spark.owner = id;
		spark.direction = other.direction + 180;
		spark.image_angle = spark.direction;
		audio_play_sound(snd_parry, 1, false);
		switch (other.object_index) {
		case obj_slash:
			other.owner.state = status.parried;
			other.owner.sprite_index = spr_recovery;
			other.owner.recovery = parrystop;
			instance_destroy(other);
			global.hitstop = 16;
			break;
		case obj_bullet:
			reflected = other.owner;
			counterspeed = other.spd;
			instance_destroy(other);
			global.hitstop = 9 * counterspeed / bulletspeed;
			break;
		}
	} else if (invul <= 0) {
		invul = invultime;
		global.hitstop = 20;
		deaths += 1;
		instance_create_layer(x, y, "hitboxes", obj_boom);
		audio_play_sound(snd_dies, 1, false);
		bullet = true;
		spawning = true;
		for (i = 0; i < 20; i++) {
			trail = instance_create_layer(x, y, "trails", obj_dust);
			trail.image_blend = color;
			trail.speed = random_range(other.spd - 2, other.spd + 2);
			trail.direction = other.direction + random_range(-5, 5);
			trail.gravity = random_range(grav - 0.1, grav + 0.1);
			trail.gravity_direction = 270;

		}
	}
}