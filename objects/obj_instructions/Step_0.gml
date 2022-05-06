/// @description Insert description here
// You can write your code in this editor

start = 0;
select = false;

if (!global.inassign) {

	for (var i = 0; i < GP+KB; i++;)
	{

		if global.down[i][input.ST] {
			start += 1;
		}
		if global.pressed[i][input.SE] {
			room_goto_previous();
		} 
	}

}

if (start) timer += power(start,2) / 160;
else timer -= 0.01;
timer = clamp(timer,0,1);

if (timer >= 1) {
	room_goto(global.stage);
}

y=lerp(y,384,0.2);
