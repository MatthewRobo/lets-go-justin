/// @description Insert description here
// You can write your code in this editor

enum shot {
	bullet = 0,
	shotgun,
	wallbang,
	whiffpunisher,
	booster,
	trailer,
	grenade,
	geyser,
	sin,
	length
}

gamepad = 0;
gamepad = global.lookup[team];
shottype = global.shots[team];
color = global.color[team];

recovery = instance_number(obj_controller) > 0 ? obj_controller.roundstart : recovery;
state = status.recovery;

switch shottype {
	case shot.bullet:
		bulletspeed = 32;
		gunrecovery = 22;
		gunreload = 38;
		break;
	case shot.shotgun:
		bulletspeed = 8;
		gunrecovery = 28;
		gunreload = 45;
		shotactive = 28;
		recoil = 16;
		break;
	case shot.wallbang:
		shotobj = obj_wallbang;
		bulletspeed = -10;
		bulletmaxspeed = 10;
		gunrecovery = 44;
		gunreload = 75;
		shotactive = 240;
		break;
	case shot.whiffpunisher:
		ammomax = 6;
		bulletspeed = 40;
		gunrecovery = 10;
		gunreload = 40;
		shotactive = 6;
		break;
	case shot.booster:
		shotobj = obj_anchor;
		ammomax = 5;
		bulletspeed = 0;
		gunrecovery = 0;
		gunreload = 50;
		shotactive = 10;
		recoil = -18;
		break;
	case shot.trailer:
		shotobj = obj_trailer;
		bulletspeed = 16;
		gunrecovery = 35;
		gunreload = 85;
		shotactive = 25;
		break;
	case shot.grenade:
		shotobj = obj_grenade;
		bulletspeed = 10;
		gunrecovery = 40;
		gunreload = 40;
		shotactive = 40;
		break;
	case shot.geyser:
		shotobj = obj_timed;
		ammomax = 2;
		bulletspeed = 6;
		gunrecovery = 20;
		gunreload = 37;
		shotactive = 8;
		break;
	case shot.sin:
		shotobj = obj_sin;
		ammomax = 3;
		bulletspeed = 0;
		gunrecovery = 30;
		gunreload = 40;
		break;
}

ammo = ammomax;
