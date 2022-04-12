/// @description Insert description here
// You can write your code in this editor

if (other.team != team && (collision_line(x, y, other.x, other.y, obj_wall, false, false) == noone || other.object_index == obj_wallbang))  {
	if (state == status.parry) {
		invul += 5;
		state = status.idle;
		sprite_index = ammo > 0 ? spr_idle : spr_empty;
		spark = instance_create_layer(x, y, "parryfx", obj_parry);
		spark.owner = id;
		spark.direction = other.direction + 180;
		spark.image_angle = spark.direction;
		audio_play_sound(snd_parry, 1, false);
		if (other.object_index == obj_slash) {
			other.owner.state = status.parried;
			other.owner.sprite_index = spr_recovery;
			other.owner.recovery = parrystop;
			instance_destroy(other);
			global.hitstop = 16;
		}
		else {

			reflected = other.owner;
			counterspeed = other.spd < 32 ? 32 : other.spd;
			instance_destroy(other);
			global.hitstop = 9 * counterspeed / 32;

		}
	} else if (invul <= 0) {
		deaths += 1;
		instance_create_layer(x, y, "hitboxes", obj_boom);
		audio_play_sound(snd_dies, 1, false);
		spawning = spawntime;
		global.hitstop = 20;
		if (deaths == global.firstto) {
			global.hitstop += 120;
			ultradies = audio_play_sound(snd_dies, 1, false);
			audio_sound_pitch(ultradies, 20/120);
		}
		spawnpoint = instance_furthest(other.owner.x, other.owner.y, obj_respawn);
		invul = invultime;
		
		for (i = 0; i < 250; i++) {
			trail = instance_create_layer(x, y, "trails", obj_glitter);
			trail.image_blend = color;
			//trail.speed = random_range(other.spd - 2, other.spd + 2);
			//trail.direction = other.direction + random_range(-5, 5);
			//trail.gravity = random_range(grav - 0.1, grav + 0.1);
			//trail.gravity_direction = 270;
			if (irandom(1)) trail.image_blend = c_white;
			trail.speed = random(5);
			trail.image_index = random(8);
			trail.friction = 0.25;
			trail.direction = random(360);
			trail.gravity = random_range(0.1, 0.3);
			trail.gravity_direction = other.direction;
			trail.x = random_range(bbox_left, bbox_right);
			trail.y = random_range(bbox_bottom, bbox_top);
		}
		trail = instance_create_layer(x,y,"trails",obj_burst);
		trail.image_blend = color;
		trail.image_angle = other.direction;

	}
}