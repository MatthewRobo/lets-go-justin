/// @description Insert description here
// You can write your code in this editor
thickness = 1;
timer = 240;
switch global.thingy {
	case thingies.wave:
	hspeed = irandom_range(1.5,5);
	thickness = irandom_range(1,3);
	break;
	case thingies.rectangle:
	hspeed = irandom_range(4,10);
	thickness = irandom_range(1,16);
	break;
}

if (x>room_width/2) hspeed *= -1;
if (irandom(2)) hspeed *= -1;
image_alpha = 0;
alpha = 0;

team = irandom(1);
if (global.mode == gamemode.teamvs) team = irandom(3);
alpha2 = 1;
alphamax = random_range(0.3,0.9);
amp = random_range(1.5,16);
xoffset = random_range(-room_width,room_width);
thickness2 = irandom(4);
