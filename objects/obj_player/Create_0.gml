/// @description Insert description here
// You can write your code in this editor

enum status {
	idle,
	parry,
	recovery,
	stun,
	parried
}

show_debug_message("X");

state = status.idle;
shottype = shot.bullet;
shotobj = obj_bullet;
grounded = 5;
coyote = 5;

team = 0;
teamstr = "";
gamepad = 0;
spawnpoint = obj_respawn;

deaths = 0;
roundstart = 0;
roundfreeze = 0;

maxsp = 128;
runsp = 12;
accel = 2;
deccel = 1.5;
walksp = 2;
movesp = runsp;
stunsp = 1;
stunaccel = 0.25;
stundeccel = 0.3;

vsp = 0;
hsp = 0;
sp = 0;

invul = 0;
invultime = 150;

stun = 0;
recovery = 0;

//teamstun = 40;

buffer = 6;
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
hopsp = 6;
jumpforce = jumpsp;
thrust = 0.9;

grav = 0.5;
recoil = 0;
recoilstun = 0;

ammo = 1;
ammomax = 1;
bulletspeed = 24;
bulletmaxspeed = bulletspeed;
gunrecovery = 22;
gunreload = 38;
shotactive = 1080;

slashspeed = 16 * 1.5;
slashactive = 5;
slashrecovery = 9;

nslashspeed = 4;

parryactive = 10;
parrymax = 30 - parryactive;
parryrecovery = 10;
parrystop = 5;
reflectmult = 1.1;
counterspeed = bulletspeed;
reflected = noone;
superreflect = false;
autoparry = 0;
autoparryactive = 2;

dir = 5;
left = false;
right = false;
up = false;
jumpheld = false;
canrelease = false;
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

spr_idle = sprite_index;

scale = 1;
image_xscale = scale;
image_yscale = scale;

tlen = 20;
tcounter = 0;
tx = array_create(tlen, x);
ty = array_create(tlen, y);

layerdepth = layer_get_depth(layer);

lifetime = 0;

//qlen = 60;
//dirqueue = array_create(qlen,5);
//qt = 0;
//candash = false;
flash = false;
jiggle = 0;
wjiggle = 1;
hjiggle = 1;
jiggledir = 1;

reflectx = x;
reflecty = y;

if (x > room_width / 2) image_xscale = -1 * scale;

teammate = noone;
allyteam = -1;

silent = false;
dead = 0;
deadx = x;
deady = y;
deadangle = 0;
reloading = false;

gbid = layer_background_get_id("background");
outlinescale = 1;