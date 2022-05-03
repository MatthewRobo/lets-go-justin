/// @description Insert description here
// You can write your code in this editor
xprev = x;
yprev = y;
x = 0;
y = 0;

var i;
for (var i = 0; i < instance_number(obj_player); ++i;)
{
	players[i] = instance_find(obj_player,i);
	x += players[i].x;
	y += players[i].y;
}
var lerpfactor = 0.1;


x = lerp(xprev,x/i,lerpfactor);
y = lerp(yprev,y/i,lerpfactor);
