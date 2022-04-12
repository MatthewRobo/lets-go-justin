/// @description Insert description here
// You can write your code in this editor

gamepad = 0;
gamepad = global.lookup[team];
shottype = global.shots[team];

recovery = obj_controller.roundstart;
state = status.recovery;

switch shottype {
	case shot.bullet:
		ammo = 1;
		bulletspeed = 32;
		gunrecovery = 22;
		gunreload = 38;
		break;
	case shot.shotgun:
		ammo = 1;
		ammomax = 1;
		bulletspeed = 28;
		gunrecovery = 28;
		gunreload = 45;
		shotactive = 9;
		recoil = 6;
		break;
	case shot.wallbang:
		ammo = 1;
		bulletspeed = -5;
		bulletmaxspeed = 40;
		gunrecovery = 50;
		gunreload = 75;
		shotactive = 240;
		break;
	case shot.whiffpunisher:
		ammo = 2;
		ammomax = 2;
		bulletspeed = 32;
		gunrecovery = 6;
		gunreload = 50;
		shotactive = 8;
		break;
	case shot.booster:
		ammo = 5;
		ammomax = 5;
		bulletspeed = 0;
		gunrecovery = 0;
		gunreload = 50;
		shotactive = 10;
		recoil = -18;
		break;
	case shot.trailer:
		ammo = 1;
		ammomax = 1;
		bulletspeed = 16;
		gunrecovery = 35;
		gunreload = 85;
		shotactive = 25;
		break;
	case shot.grenade:
		ammo = 1;
		ammomax = 1;
		bulletspeed = 10;
		gunrecovery = 40;
		gunreload = 40;
		shotactive = 40;
		break;
}
