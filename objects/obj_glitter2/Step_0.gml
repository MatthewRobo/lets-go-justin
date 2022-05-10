/// @description Insert description here
// You can write your code in this editor

timer--;
if (timer > 60) alpha = lerp(alpha,1,0.05);
else alpha = lerp(alpha,0,0.05);
if (timer < 0) instance_destroy();
var _alpha = 0.2;
if (room == Main_Menu) _alpha = obj_mainmenu.expanded ? 0.4 : 1;
alpha2 = lerp(alpha2, _alpha, 0.05);
