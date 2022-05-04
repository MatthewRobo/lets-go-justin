/// @description Insert description here
// You can write your code in this editor

textscale = 16/72;
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
		attack = instance_create_layer(reflectx, reflecty, "hitboxes", obj_bullet);
		attack.owner = self;
		attack.team = team;
		attack.direction = point_direction(reflectx, reflecty, reflected.x, reflected.y);
		attack.spd = counterspeed * reflectmult;
		attack.spd = attack.spd > 44 ? 44 : attack.spd;

		if (superreflect) { 
			attack.image_xscale = 6;
			attack.image_yscale = 6;
			attack.x = reflected.x+reflected.hsp;
			attack.y = reflected.y+reflected.vsp;
			attack.spd = 0;
			attack.direction = point_direction(0,0,reflected.hsp,reflected.vsp);
			attack.timer = 2;
			
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
			if (grounded < 0) {
				audio_play_sound(snd_land, 0, false);
				jiggle = 1;
				jiggledir = 1;
				instance_place(x,y+vsp,obj_outline).lerpmod += vsp / 2;
				lifetime = 270;
			}
			canhover = false;
			grounded = coyote;
		} else {
			jiggle = 0.6;
			jiggledir = -1;
			audio_play_sound(snd_land, 0, false);
		}

	} else {
		grounded--;
		lifetime = 90;
	}


	if (spawning == spawntime) {
		dead = false;
		lifetime = 270;
		depth = layerdepth + 1;

		ammo = ammomax;
		audio_play_sound(snd_spawn, 0, false);
		x = spawnpoint.x;
		y = spawnpoint.y;
		state = status.recovery;
		spawnpoint.occupied = false;
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
					attack.spd = nslashspeed;
					attack.hsp = lengthdir_x(attack.spd, attack.direction);
					attack.vsp = lengthdir_y(attack.spd, attack.direction);
					attack.image_angle = attack.direction;
					recovery = slashactive + slashrecovery;
					state = status.recovery;
				}
			} else {
				attack = instance_create_layer(x, y, "hitboxes", obj_slash);
				attack.owner = self;
				attack.team = team;
				attack.direction = direction;
				attack.spd = slashspeed;
				attack.hsp = lengthdir_x(attack.spd, attack.direction);
				attack.vsp = lengthdir_y(attack.spd, attack.direction);
				attack.image_xscale *= 1.5;
				attack.image_angle = attack.direction;
				recovery = slashactive + slashrecovery;
				state = status.recovery;
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
				if (!silent) audio_play_sound_at(snd_shoot, -x + room_width/2,y,400,100,500,1,false, false);

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
						attack = instance_create_layer(x-hsp, y-vsp, "hitboxes", shotobj);
						attack.owner = self;
						attack.timer = shotactive;
						attack.team = team;
						attack.direction = direction;
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
						
						//boom = instance_create_layer(x,y,"trails",obj_boom);
						//boom.image_blend = color;
						//boom.image_xscale = 1.5;
						//boom.image_yscale = 1.5;
						
						boom = instance_create_layer(x+lengthdir_x(dist,direction),y+lengthdir_y(dist,direction),"trails",obj_boom);
						boom.image_blend = color;
						boom.image_xscale = 1;
						boom.image_yscale = 3;
						boom.image_angle = direction;
						
						
						trail = instance_create_layer(x,y,"trails",obj_gradientspike);
						trail.owner = self;
						trail.length = dist;
						trail.direction = direction;
						trail.thickness = 8;
						
						//trail = instance_create_layer(x + lengthdir_x(dist/2, direction), y+lengthdir_y(dist/2,direction), "trails", obj_squaretrail);
						//trail.image_xscale = dist / 40;
						//trail.image_yscale = 1/5;
						//trail.image_angle = direction;
						//trail.owner = self;
						//trail.image_blend = color;
						
						gap = 3;
						for (i = 0; i < 4; i ++) {
							for (j = -1; j <= 1; j += 2) {
								attack = instance_create_layer(x + lengthdir_x(dist - i * gap, direction), y + lengthdir_y(dist - i * gap, direction), "hitboxes", shotobj);
								attack.image_xscale = 2;
								attack.image_yscale = 1;
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
						len = shotactive;
						for (i = 0; i < 25; i ++) {
							attack = instance_create_layer(x, y, "hitboxes", shotobj);
							attack.owner = self;
							attack.team = team;
							attack.direction = direction;
							j = i * 5.4 + 45;
							attack.timer = j;
							attack.spd =  len/j + bulletspeed;
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
					case shot.surface:
						spread = 15;
						

						maxdist = 0;
						for (i = -spread/2; i <= spread/2; i += spread/10) {

							dist = 0;

							angle = direction + i;
							while (!position_meeting(x+lengthdir_x(dist, angle), y+lengthdir_y(dist, angle), obj_wall)) { //whilst the next pixel isn't a wall
								dist ++;
							}

							dist--;
							if (dist > maxdist) maxdist = dist;
							attack = instance_create_layer(x+lengthdir_x(dist,angle), y+lengthdir_y(dist,angle), "hitboxes", shotobj);
							attack.owner = self;
							attack.team = team;
							attack.direction = angle;
							attack.timer = shotactive + abs(i);
						}
						
						trail = instance_create_layer(x,y,"trails",obj_gradientspike);
						trail.owner = self;
						trail.length = maxdist;
						trail.direction = direction;
						trail.thickness = maxdist * dsin(spread/2);
						break;
					}
				

				recovery = gunrecovery;
				ammo--;
				stun = recoilstun;
				state = status.stun;
				if (stun <= 0) {
					state = recovery > 0 ? status.recovery : status.idle;
				}				
			} else {
				audio_play_sound(snd_reload, 0, false);
				recovery = gunreload;
				reloading = recovery;
				flash = true;
				jiggle += 0.3;
				if (shottype = shot.random) {
					bulletspeed = irandom_range(8,40);
					shotactive = irandom_range(6,60);
					ammomax = irandom_range(1,6);
					gunrecovery = irandom_range(10,40) - ammomax;
					gunreload = irandom_range(10,30) * ammomax;
					recoil = irandom_range(-20,20);
				}

				state = status.recovery;
			}
		}
		if (parry) {
			audio_play_sound(snd_shield, 0, false);
			invul /= 3;
			recovery = parryactive;
			state = status.parry;
		}
		break;
	case status.recovery:
		if (walksp) {
			if (left && !right) image_xscale = -scale;
			else if (right && !left) image_xscale = scale;
		}
		if (shoot) {
			audio_play_sound(snd_jam,0,0);
			flash = true;
		}
		if (reloading) {
			var ammoprev = ammo;
			ammo = floor(lerp(ammomax,0,recovery/reloading));
			if (ammoprev < ammo) {
				flash = true;
				audio_play_sound(snd_jam,0,0);
				jiggle += 0.3;
			}
			
		}
		recovery--;
		if (recovery <= 0) {
			if (reloading) {
				reloading = 0;
				ammo = ammomax;
				flash = true;
				audio_play_sound(snd_jam,0,0);
				jiggle += 0.3;
			}
			state = status.idle;
		}
		break;
	case status.parry:
		lifetime = 270;
		recovery--;
		audio_play_sound(snd_heldparry, 0,0);
		if ((!heldparry && recovery <= 0) || (recovery <= -parrymax)) {
			recovery = parryrecovery - recovery;
			state = status.recovery;
		}
		trail = instance_create_layer(x, y, "trails", obj_playertrail);
		trail.image_index = image_index;
		trail.image_blend = c_aqua;
		trail.image_xscale = lerp(1, 1.5, (recovery + 1) / parryrecovery) * sign(image_xscale) * scale;
		trail.image_yscale = lerp(1, 1.5, (recovery + 1) / parryrecovery) * scale;
		break;
	case status.stun:
		lifetime = 0;
		if (shoot) {
			audio_play_sound(snd_jam,0,0);
		}
		stun--;
		recovery=clamp(recovery-1,0,99999);
		if (stun <= 0) {
			state = recovery > 0 ? status.recovery : status.idle;
		}
		break;
	case status.parried:
		lifetime = 270;
		recovery--;
		if (recovery <= 0) {
			state = status.idle;
		}
		break;
	}
	
	if (state != status.parried) {
		if (jiggle > 0) jiggle *= 0.7;
		wjiggle = lerp(1,2,jiggle);
		hjiggle = lerp(1,0.5,jiggle);
		
		// *** PHYSICS AND COLLISION ***
		
		// deccelerate when not moving
		var _deccel = state == status.stun ? stundeccel : deccel;
		if ((grounded >= 3 && (dir == 1 || dir == 3) ) || dir == 2 || dir == 5 || dir == 8 || state != status.idle) {
			hsp = abs(hsp) <= _deccel ? 0 : hsp - sign(hsp) * _deccel;
		}
		if (state != status.parry) && (state == status.idle || walksp) {
			//show_debug_message(state);
			if (vvec > 0) {
				lifetime = 270;
				if (jiggle < 1) jiggle += 0.075;
			}
			//if (teabag) {
			//	lifetime = 0;
			//}
			jumpforce = state == status.idle ? jumpsp : hopsp;
			if (jump && state != status.stun) {
				if (grounded > 0) {
					jiggle = 0.3;
					jiggledir = 1;
					vsp = -jumpforce;
					grounded = 0;
					audio_play_sound(snd_jump, 0, false);
					canhover = false;
				} else canhover = true;
			}
			var _accel;
			switch state {
				case status.idle: movesp = runsp; _accel = accel; break;
				case status.recovery: movesp = walksp; _accel = accel; break;
				case status.stun: movesp = stunsp; _accel = stunaccel; break;
			}
			
			_deccel = _deccel < 1 ? _deccel : 1;
			
			if (dir == 4 || dir == 7 || dir == 1) {
				if (dir == 1 && grounded >= 3) movesp = walksp;
				hsp = hsp > -movesp ? hsp - _accel : hsp + _deccel;
				//if candash && (dir == 4 && dirqueue[(qt-1+qlen)mod qlen] == 5 && dirqueue[(qt-10+qlen)mod qlen] == 4) {
				//	hsp = -20;
				//}
			} else if (dir == 6 || dir == 9 || dir == 3) {
				if (dir == 3 && grounded >= 3) movesp = walksp;
				hsp = hsp <  movesp ? hsp + _accel :  hsp - _deccel;
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
		var nograv = instance_position(x + hsp, y + vsp, obj_uplift);
		if (nograv != noone) {
			vsp -= ((bbox_bottom - nograv.bbox_top) / nograv.sprite_height) * 2;
			vsp *= 0.95;
			if (vvec > 0 && state != status.stun) vsp += 0.25;
		}
		
		if place_meeting(x + hsp, y, obj_wall) || collision_line(x,y,x+hsp,y,obj_wall,0,0) {
			while (!place_meeting(x + sign(hsp), y, obj_wall)) { //whilst the next pixel isn't a wall
				x += sign(hsp);
			}
			hsp = state == status.stun ? hsp * -0.8 : 0;
		} else {
			x += hsp;
		}
		if place_meeting(x, y + vsp, obj_wall) || collision_line(x,y,x,y+vsp,obj_wall,0,0) {
			while (!place_meeting(x, y + sign(vsp), obj_wall)) { //whilst the next pixel isn't a wall
				y += sign(vsp);
			}
			vsp = state == status.stun ? vsp * -0.8 : 0;
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

	tx[tcounter] = x;
	ty[tcounter] = y;
	tcounter++;
	tcounter = tcounter mod tlen;
	
	lifetime+= 360/(60 - abs(hsp));
	
	autoparry--;
	deadx = x;
	deady = y;
} else {
	image_speed = 0;
	talpha = 1;
	
	if (dead) {

		var ddir = point_direction(deadx,deady,spawnpoint.x,spawnpoint.y);
		var factor = power(1-(global.hitstop/dead),2);
		var dangle = ddir - deadangle;
		var dy = 64 * dsin(dangle) * dsin(180  * factor);
		var dx = 0;
		_c = dcos(ddir);
		_s = dsin(ddir);


		x = lerp(deadx,spawnpoint.x,factor);
		y = lerp(deady,spawnpoint.y,factor);
		x = x + _c * dx + _s * dy;
		y = y + _c * dy - _s * dx;
		tx[tcounter] = x;
		ty[tcounter] = y;
		tcounter++;
		tcounter = tcounter mod tlen;
	}
}
//qt ++;
//qt = qt mod qlen;
		textscale = textscale + (1-textscale) * spawning/spawntime;
flash *= 0.8;
