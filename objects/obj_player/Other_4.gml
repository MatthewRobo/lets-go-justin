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
		shotactive = 8;
		recoil = 6;
		break;
	case shot.wallbang:
		ammo = 1;
		bulletspeed = 24;
		bulletmaxspeed = 40;
		gunrecovery = 50;
		gunreload = 75;
		shotactive = 10;
		break;
	case shot.whiffpunisher:
		ammo = 3;
		ammomax = 3;
		bulletspeed = 32;
		gunrecovery = 6;
		gunreload = 45;
		shotactive = 8;
		break;
	case shot.booster:
		ammo = 5;
		ammomax = 5;
		bulletspeed = 5;
		gunrecovery = 0;
		gunreload = 45;
		shotactive = 1;
		recoil = -18;
		break;
	case shot.trailer:
		ammo = 1;
		ammomax = 1;
		bulletspeed = 16;
		gunrecovery = 35;
		gunreload = 90;
		shotactive = 25;
		break;
	case shot.grenade:
		ammo = 1;
		ammomax = 1;
		bulletspeed = 10;
		gunrecovery = 40;
		gunreload = 50;
		shotactive = 40;
		break;
}
