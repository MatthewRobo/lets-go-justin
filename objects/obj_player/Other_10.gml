/// @description Assign shottypes
// You can write your code in this editor

enum shot {
	bullet = 0,
	shotgun,
	whip,
	whiffpunisher,
	
	wallbang,
	trailer,
	wall2,
	grenade,

	booster,
	geyser,
	sin,
	random,
	

	wallbang2,
	crossbow,
	length,
	surface
}
shottype = global.shots[team];

ammo = 1;
ammomax = 1;
bulletspeed = 24;
bulletmaxspeed = bulletspeed;
gunrecovery = 22;
gunreload = 38;
recoil = 0;
recoilstun = 0;
shotactive = 1080;
shotobj = obj_bullet;


switch shottype {
	case shot.bullet:
		bulletspeed = 32;
		gunrecovery = 22;
		gunreload = 38;
		break;
	case shot.crossbow:
		bulletspeed = 32;
		gunrecovery = 22;
		gunreload = 38;
		break;
	case shot.shotgun:
		bulletspeed = 24;
		recoilstun = 0;
		gunrecovery = 9+5;
		gunreload = 45;
		shotactive = 5;
		recoil = 0;
		ammomax = 2;
		break;
	case shot.wallbang:
		shotobj = obj_wallbang;
		bulletspeed = 24;
		bulletmaxspeed = 16;
		gunrecovery = 30;
		gunreload = 40;
		shotactive = 5/0.5;
		break;
	case shot.wallbang2:
		shotobj = obj_wallbang2;
		bulletspeed = -12;
		bulletmaxspeed = 9;
		gunrecovery = 30;
		gunreload = 50;
		shotactive = 400;
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
		gunreload = 70;
		shotactive = 25;
		break;
	case shot.grenade:
		shotobj = obj_grenade;
		ammomax = 2;
		bulletspeed = 10;
		gunrecovery = 40;
		gunreload = 50;
		shotactive = 40;
		break;
	case shot.geyser:
		shotobj = obj_shrink;
		ammomax = 2;
		bulletspeed = 8;
		gunrecovery = 17;	
		gunreload = 30;
		shotactive = 8;
		recoil = 0;
		break;
	case shot.sin:
		shotobj = obj_sin;
		ammomax = 3;
		bulletspeed = 0;
		gunrecovery = 30;
		gunreload = 40;
		break;
	case shot.whip:
		shotobj = obj_timed;
		ammomax = 2;
		bulletspeed = 1;
		shotactive = 256;
		gunrecovery = 40;
		gunreload = 70;
		break;
	case shot.wall2:
		shotobj = obj_timed;
		ammomax = 2;
		bulletspeed = 2;
		gunrecovery = 35;
		gunreload = 60;
		shotactive = 240;
		break;
	case shot.random:
		bulletspeed = irandom_range(8,40);
		shotactive = irandom_range(6,60);
		ammomax = irandom_range(1,6);
		recoilstun = irandom_range(0,10);
		gunrecovery = irandom_range(10,40) - ammomax - recoilstun;
		gunreload = irandom_range(10,30) * ammomax;
		recoil = irandom_range(-20,20);
		break;
	case shot.surface:
		shotobj = obj_timed;
		bulletspeed = 0;
		shotactive = 240;
		gunrecovery = 30;
		gunreload = 40;
		break;
}

ammo = ammomax;

show_debug_message(shottype);
