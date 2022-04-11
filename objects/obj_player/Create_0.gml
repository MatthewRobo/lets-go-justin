/// @description Insert description here
// You can write your code in this editor

enum status {
	idle,
	parry,
	recovery,
	parried
}

enum shot {
	bullet,
	shotgun,
	wallbang,
	whiffpunisher,
	booster,
	trailer,
	grenade
}

state = status.idle;
shottype = shot.bullet;
grounded = 5;
coyote = 5;

team = 0;
teamstr = "";
gamepad = 0;
spawnpoint = obj_respawn;

deaths = 0;

maxspeed = 12;
accel = 1.5;
deccel = 1.5;

vsp = 0;
hsp = 0;

invul = 0;
invultime = 150;

recovery = 0;

shoot = false;
parry = false;
slash = false;
heldparry = false;
spawning = false;
spawntime = 20;
jump = false;
jumpmax = 30
airjumps = jumpmax;
maxfall = 16;
jumpsp = 13;
thrust = 0.9;

grav = 0.5;
recoil = 0;

ammo = 1;
ammomax = 1;
bulletspeed = 24;
bulletmaxspeed = bulletspeed;
gunrecovery = 22;
gunreload = 38;
shotactive = 999;

slashspeed = 16;
slashactive = 5;
slashrecovery = 9;

parryactive = 10;
parrymax = 30 - parryactive;
parryrecovery = 19;
parrystop = 5;
reflectmult = 1.1;
counterspeed = bulletspeed;
reflected = noone;


dir = 5;
left = false;
right = false;
up = false;
uprelease = false;
down = false;
hover = false;
canhover = false;

/* direction is in numpad notation
 UL     UP    UR
     7  8  9
  L  4  5  6   R
     1  2  3
 DL     DN    DR
*/

color = c_white;
image_blend = color;

spr_idle = spr_player;
spr_empty = spr_idle;
spr_parry = spr_idle;
spr_recovery = spr_idle;


boom = instance_create_layer(x, y, "hitboxes", obj_boom);
boom.image_xscale = 2;
boom.image_yscale = 2;
boom.image_blend = color;
boom = instance_create_layer(x, y, "hitboxes", obj_boom);
boom.image_xscale = 2.6;
boom.image_yscale = 2.6;

scale = 1.5;
image_xscale = scale;
image_yscale = scale;
