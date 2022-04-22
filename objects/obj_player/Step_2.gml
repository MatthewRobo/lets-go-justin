/// @description Insert description here
// You can write your code in this editor
if (vvec > 0) lifetime = 270;

// input handling
dir = 5;
if (left && !right) dir = 4;
else if (right && !left) dir = 6;
if (up) dir += 3;
else if (down) {
	dir -= 3;
	if (global.hitstop <= 0) image_index = 0;
}
//dirqueue[qt] = dir;
// for aiming, does not affect own movement
switch (dir) {
case 1:
	direction = 225;
	break;
case 2:
	direction = 270;
	break;
case 3:
	direction = 315;
	break;
case 4:
	direction = 180;
	break;
case 5:
	if (image_xscale <= 0) direction = 180;
	else direction = 0;
	break;
case 6:
	direction = 0;
	break;
case 7:
	direction = 135;
	break;
case 8:
	direction = 90;
	break;
case 9:
	direction = 45;
	break;
}

if (global.hitstop <= 0) {
	// handles spawning reflected bullet
	// code block is here so that the bullet only spawns
	image_speed = 1;
	if (reflected != noone) {
		attack = instance_create_layer(x, y, "hitboxes", obj_bullet);
		attack.owner = self;
		attack.team = team;
		attack.direction = point_direction(x, y, reflected.x, reflected.y);
		attack.spd = counterspeed * reflectmult;
		attack.spd = attack.spd > 44 ? 44 : attack.spd;

		if (superreflect) { 
			attack.image_xscale = 4;
			attack.image_yscale = 4;
			attack.x = reflected.x+reflected.hsp;
			attack.y = reflected.y+reflected.vsp;
			attack.spd = 0;
			attack.direction = point_direction(0,0,reflected.hsp,reflected.vsp);
			attack.timer = 1;
			
		}
		attack.hsp = lengthdir_x(attack.spd, attack.direction);
		attack.vsp = lengthdir_y(attack.spd, attack.direction);
		attack.image_angle = attack.direction;
		superreflect = false;
		reflected = noone;
	}
	// handles coyote time and ground detection
	if place_meeting(x, y + vsp, obj_wall) {
		if (vsp >= 0) {
			airjumps = jumpmax;
			if (grounded < 0) audio_play_sound(snd_land, 0, false);
			canhover = false;
		}
		grounded = coyote;
	} else {
		grounded--;
		lifetime = 90;
	}


	if (spawning == spawntime) {
		lifetime = 270;
		depth = layerdepth + 1;

		ammo = ammomax;
		audio_play_sound(snd_spawn, 0, false);
		x = spawnpoint.x;
		y = spawnpoint.y;
		state = status.recovery;
		recovery = 1;
		boom = instance_create_layer(x, y, "hitboxes", obj_boom);
		boom.image_xscale = 2;
		boom.image_yscale = 2;
		boom.image_blend = color;
		boom = instance_create_layer(x, y, "hitboxes", obj_boom);
		boom.image_xscale = 2.6;
		boom.image_yscale = 2.6;
	}


	if (spawning > 0) {
		shoot = false;
		parry = false;
		slash = false;
		spawning--;
	}

	switch (state) {
	case status.idle:
		if (left && !right) image_xscale = -scale;
		else if (right && !left) image_xscale = scale;

		if (!grounded && airjumps > 0 && hover && canhover) {
			sfx = audio_play_sound_at(snd_hover, -x + room_width/2,y,400,100,500,1,false, false);
			audio_sound_pitch(sfx, lerp(2, 1, airjumps / jumpmax));
			for (i = 0; i < 3; i++) {
				trail = instance_create_layer(x, y, "trails", obj_glitter);
				if (ammo <= 0) trail.image_alpha = 0.5;
				trail.image_blend = color;
				trail.vspeed = thrust;
				trail.hspeed = random_range(-0.5, 0.5);
				if (vsp > 0) {
					vsp *= 0.8;
					trail.vspeed += vsp;
				}
				trail.vspeed += random_range(-0.25, 0.25);
				if (irandom(1)) trail.image_blend = c_white;
				trail.x = random_range(bbox_left, bbox_right);
				trail.y = random_range(bbox_bottom, bbox_top);
			}
			vsp -= thrust;
			airjumps--;
		}

		if (vsp < 0 && uprelease) {
			vsp /= 2; // cut player's jump short if player releases early
		}
		if (slash) {
			invul /= 3;
			audio_play_sound_at(snd_slash, -x + room_width/2,y,400,100,500,1,false, false);
			if (dir == 5) {
				for (i = 0; i < 360; i += 45) {
					attack = instance_create_layer(x, y, "hitboxes", obj_slash);
					attack.owner = self;
					attack.team = team;
					attack.direction = i;
					attack.spd = slashspeed;
					attack.hsp = lengthdir_x(attack.spd, attack.direction);
					attack.vsp = lengthdir_y(attack.spd, attack.direction);
					attack.image_angle = attack.direction;
					recovery = slashactive + slashrecovery;
					state = status.recovery;
					sprite_index = spr_recovery;
				}
			} else {
				attack = instance_create_layer(x, y, "hitboxes", obj_slash);
				attack.owner = self;
				attack.team = team;
				attack.direction = direction;
				attack.spd = 16;
				attack.hsp = lengthdir_x(attack.spd, attack.direction);
				attack.vsp = lengthdir_y(attack.spd, attack.direction);
				attack.image_angle = attack.direction;
				recovery = slashactive + slashrecovery;
				state = status.recovery;
				sprite_index = spr_recovery;
			}
		}
		if (shoot) {
			invul /= 3;
			if (ammo > 0) {
				hsp += lengthdir_x(-recoil, direction);
				vsp += lengthdir_y(-recoil, direction) * 0.85;
				if (vsp < 0) grounded = 0;
				canhover = true;
				spark = instance_create_layer(x, y, "parryfx", obj_parry);
				spark.owner = id;
				spark.direction = direction + 180;
				spark.x += lengthdir_x(32, direction);
				spark.y += lengthdir_y(32, direction);
				spark.image_angle = spark.direction;
				audio_play_sound_at(snd_shoot, -x + room_width/2,y,400,100,500,1,false, false);

				switch shottype {
					case shot.bullet:
						attack = instance_create_layer(x, y, "hitboxes", shotobj);
						attack.owner = self;
						attack.team = team;
						attack.direction = direction;
						attack.spd = bulletspeed;
						attack.hsp = lengthdir_x(attack.spd, attack.direction);
						attack.vsp = lengthdir_y(attack.spd, attack.direction);
						break;
					case shot.shotgun:
						for (i = -45; i <= 45; i += 15) {
							attack = instance_create_layer(x, y, "hitboxes", shotobj);
							attack.owner = self;
							attack.timer = shotactive;
							attack.team = team;
							attack.direction = i + direction;
							attack.spd = bulletspeed;
							attack.hsp = lengthdir_x(attack.spd, attack.direction);
							attack.vsp = lengthdir_y(attack.spd, attack.direction);
						}
						break;
					case shot.wallbang:
						attack = instance_create_layer(x, y, "hitboxes", shotobj);
						attack.owner = self;
						attack.team = team;
						attack.direction = direction;
						attack.gravdir = direction;
						attack.spd = bulletspeed;
						attack.maxspd = bulletmaxspeed;
						attack.hsp = lengthdir_x(attack.spd, attack.direction);
						attack.vsp = lengthdir_y(attack.spd, attack.direction);
						attack.timer = shotactive;
						break;
					case shot.whiffpunisher:
						attack = instance_create_layer(x, y, "hitboxes", shotobj);
						attack.owner = self;
						attack.timer = shotactive;
						attack.team = team;
						attack.direction = direction;
						attack.image_angle = direction;
						attack.spd = bulletspeed;
						attack.hsp = lengthdir_x(attack.spd, attack.direction);
						attack.vsp = lengthdir_y(attack.spd, attack.direction);
						attack.vsp += vsp * 1.2;
						attack.vsp -= grav * 1.2;
						attack.hsp += hsp  * 1.2;
						attack.image_xscale = 2;
						break;
					case shot.booster:
						attack = instance_create_layer(x, y, "hitboxes", shotobj);
						attack.owner = self;
						attack.timer = shotactive;
						attack.team = team;
						attack.direction = direction + 180;
						attack.spd = point_distance(0,0,hsp,vsp);
						break;
					case shot.trailer:
						attack = instance_create_layer(x, y, "hitboxes", shotobj);
						attack.owner = self;
						attack.timer = shotactive;
						attack.team = team;
						attack.direction = direction;
						attack.spd = bulletspeed;
						attack.hsp = lengthdir_x(attack.spd, attack.direction);
						attack.vsp = lengthdir_y(attack.spd, attack.direction);
						break;
					case shot.grenade:
						attack = instance_create_layer(x, y, "hitboxes", shotobj);
						attack.owner = self;
						attack.timer = shotactive;
						attack.team = team;
						attack.direction = direction;
						attack.spd = bulletspeed;
						attack.hsp = lengthdir_x(attack.spd, attack.direction);
						attack.vsp = lengthdir_y(attack.spd, attack.direction);
						attack.vsp -= 6;
						attack.vsp += vsp / 4;
						attack.hsp += hsp / 4;
						break;
					case shot.geyser:
						dist = ammo == ammomax ? 40 * 8 : 40 * 4;

						if (collision_line(x, y, x + lengthdir_x(dist, direction), y + lengthdir_y(dist, direction), obj_wall, 0, 0)) {
							dist = 0;
							while (!position_meeting(x + lengthdir_x(dist, direction), y + lengthdir_y(dist, direction), obj_wall)) { //whilst the next pixel isn't a wall
								dist ++;
							}
							dist --;
						}
						
						trail = instance_create_layer(x + lengthdir_x(dist/2, direction), y+lengthdir_y(dist/2,direction), "trails", obj_squaretrail);
						trail.image_xscale = dist / 40;
						trail.image_yscale = 1/5;
						trail.image_angle = direction;
						trail.owner = self;
						trail.image_blend = color;
						
						gap = 3;
						for (i = 0; i < 4; i ++) {
							for (j = -1; j <= 1; j += 2) {
								attack = instance_create_layer(x + lengthdir_x(dist - i * gap, direction), y + lengthdir_y(dist - i * gap, direction), "hitboxes", shotobj);
								attack.image_xscale = 2;
								attack.image_yscale = 0.75;
								attack.owner = self;
								attack.timer = i == 1 || i == 2 ? shotactive + 2 * i : shotactive + i;
								attack.team = team;
								attack.direction = direction + 100 * j + (i * 20 ) * j;
								attack.image_angle = attack.direction;
								attack.spd = i == 1 || i == 2 ? 1.5 * bulletspeed : bulletspeed;
								attack.hsp = lengthdir_x(attack.spd, attack.direction);
								attack.vsp = lengthdir_y(attack.spd, attack.direction);
							}
						}
						break;
					case shot.sin:
						switch ammo {
							case 3: shotobj = obj_sin; break;
							case 2: shotobj = obj_cos; break;
							case 1: shotobj = obj_tan; break;
						}
						attack = instance_create_layer(x, y, "hitboxes", shotobj);
						attack.owner = self;
						attack.team = team;
						attack.direction = direction;
						attack.spd = bulletspeed;
						attack.hsp = lengthdir_x(attack.spd, attack.direction);
						attack.vsp = lengthdir_y(attack.spd, attack.direction);
						break;
					case shot.whip:
						flip = ammo mod 2 ? 1 : -1;
						len = shotactive * bulletspeed;
						for (i = 0; i < 360; i += 360 / 10) {
							attack = instance_create_layer(x, y, "hitboxes", shotobj);
							attack.owner = self;
							attack.team = team;
							attack.direction = direction + dcos(i) * 15 * flip;
							j = 10 + i / 20;
							attack.timer = j;
							attack.spd =  len/j + 1;
							attack.hsp = lengthdir_x(attack.spd, attack.direction);
							attack.vsp = lengthdir_y(attack.spd, attack.direction);
						}
						break;
					case shot.wall2:
						len = shotactive * bulletspeed;
						for (i = 0; i < 25; i ++) {
							attack = instance_create_layer(x, y, "hitboxes", shotobj);
							attack.owner = self;
							attack.team = team;
							attack.direction = direction;
							j = i * 5.4 + 45;
							attack.timer = j;
							attack.spd =  len/j + 1;
							attack.hsp = lengthdir_x(attack.spd, attack.direction);
							attack.vsp = lengthdir_y(attack.spd, attack.direction);
						}
						break;
					case shot.random:
						attack = instance_create_layer(x, y, "hitboxes", shotobj);
						attack.owner = self;
						attack.team = team;
						attack.direction = direction;
						attack.timer = shotactive;
						attack.spd = bulletspeed;
						attack.hsp = lengthdir_x(attack.spd, attack.direction);
						attack.vsp = lengthdir_y(attack.spd, attack.direction);
						break;
				}

				recovery = gunrecovery;
				ammo--;
				state = status.recovery;
				sprite_index = spr_recovery;
				if (recovery <= 0) {
					state = status.idle;
					sprite_index = ammo > 0 ? spr_idle : spr_empty;
				}
				
			} else {
				audio_play_sound(snd_reload, 0, false);
				recovery = gunreload;
				ammo = ammomax;
				state = status.recovery;
				sprite_index = spr_recovery;
			}
		}
		if (parry) {
			audio_play_sound(snd_shield, 0, false);
			invul /= 3;
			recovery = parryactive;
			state = status.parry;
			sprite_index = spr_parry;
		}
		break;
	case status.recovery:
		if (walksp) {
			if (left && !right) image_xscale = -scale;
			else if (right && !left) image_xscale = scale;
		}
		recovery--;
		if (recovery <= 0) {
			state = status.idle;
			sprite_index = ammo > 0 ? spr_idle : spr_empty;
		}
		break;
	case status.parry:
		lifetime = 270;
		recovery--;
		audio_play_sound(snd_heldparry, 0,0);
		if ((!heldparry && recovery <= 0) || (recovery <= -parrymax)) {
			recovery = parryrecovery - recovery;
			state = status.recovery;
			sprite_index = ammo > 0 ? spr_idle : spr_empty;
		}
		trail = instance_create_layer(x, y, "trails", obj_playertrail);
		trail.image_index = image_index;
		trail.image_blend = c_aqua;
		trail.image_xscale = lerp(1, 1.5, (recovery + 1) / parryrecovery) * sign(image_xscale) * scale;
		trail.image_yscale = lerp(1, 1.5, (recovery + 1) / parryrecovery) * scale;
		break;
	case status.parried:
		lifetime = 270;
		recovery--;
		if (recovery <= 0) {
			state = status.idle;
			sprite_index = ammo > 0 ? spr_idle : spr_empty;
		}
		break;
	}
	
	if (state != status.parried) {
		// *** PHYSICS AND COLLISION ***
		
		// deccelerate when not moving
		if ((grounded >= 3 && (dir == 1 || dir == 3) ) || dir == 2 || dir == 5 || dir == 8 || state != status.idle) {
			hsp = abs(hsp) <= deccel ? 0 : hsp - sign(hsp) * deccel;
		}
		if (state != status.parry && (state == status.idle || walksp)) {
			jumpforce = state == status.idle ? jumpsp : hopsp;
			if (jump) {
				if (grounded > 0) {
					vsp = -jumpforce;
					grounded = 0;
					audio_play_sound(snd_jump, 0, false);
					canhover = false;
				} else canhover = true;
			}
			
			movesp = state == status.idle ? runsp : walksp;
			if (dir == 4 || dir == 7 || dir == 1) {
				if (dir == 1 && grounded >= 3) movesp = walksp;
				hsp = hsp > -movesp ? hsp - accel : hsp + 1;
				//if candash && (dir == 4 && dirqueue[(qt-1+qlen)mod qlen] == 5 && dirqueue[(qt-10+qlen)mod qlen] == 4) {
				//	hsp = -20;
				//}
			} else if (dir == 6 || dir == 9 || dir == 3) {
				if (dir == 3 && grounded >= 3) movesp = walksp;
				hsp = hsp <  movesp ? hsp + accel :  hsp - 1;
				//if candash && (dir == 6 && dirqueue[(qt-1+qlen)mod qlen] == 5 && dirqueue[(qt-10+qlen)mod qlen] == 6) {
				//	hsp = 20;
				//}
			}
		}
		
		sp = point_distance(0,0,hsp,vsp);
		if (sp > maxsp) {
			hsp *= maxsp / sp;
			vsp *= maxsp / sp;
		}
		
		if place_meeting(x + hsp, y, obj_wall) || collision_line(x,y,x+hsp,y,obj_wall,0,0) {
			while (!place_meeting(x + sign(hsp), y, obj_wall)) { //whilst the next pixel isn't a wall
				x += sign(hsp);
			}
			hsp = 0;
		} else {
			x += hsp;
		}
		if place_meeting(x, y + vsp, obj_wall) || collision_line(x,y,x,y+vsp,obj_wall,0,0) {
			while (!place_meeting(x, y + sign(vsp), obj_wall)) { //whilst the next pixel isn't a wall
				y += sign(vsp);
			}
			vsp = 0;
		} else {
			y += vsp;
		}
		vsp = vsp + grav < maxfall ? vsp + grav : maxfall;
	}

	/*
	trail = instance_create_layer(x, y, "trails", obj_playertrail);
	trail.image_index = image_index;
	if (ammo <= 0) trail.image_alpha = 0.5;
	trail.image_blend = color;
	trail.image_xscale = image_xscale;
	trail.image_yscale = image_yscale;
	*/
	if (invul > 0) {
		invul--;
		invul = floor(invul);
		//image_alpha = abs(dsin(20 * invul));
	} else {
		image_alpha = 1;
	}
	uprelease = false;
	slash = false;
	shoot = false;
	parry = false;
	jump = false;
	tx[tcounter] = x;
	ty[tcounter] = y;
	tcounter++;
	tcounter = tcounter mod tlen;
} else {
	image_speed = 0;
	talpha = 1;
}
//qt ++;
//qt = qt mod qlen;

lifetime+= 360/(60 - abs(hsp));
