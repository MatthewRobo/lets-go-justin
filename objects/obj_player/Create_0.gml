/// @description Insert description here
// You can write your code in this editor

enum status {
	idle,
	parry,
	recovery,
	parried
}

state = status.idle;
grounded = 5;
coyote = 5;

team = 0;
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
spawning = false;
spawntime = 20;
jump = false;
jumpmax = 30
airjumps = jumpmax;
maxfall = 16;
jumpsp = 13;
thrust = 0.9;

grav = 0.5;

bullet = true;
bulletspeed = 24;
gunrecovery = 22;
gunreload = 38;

slashspeed = 16;
slashactive = 5;
slashrecovery = 9;

parryactive = 10;
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