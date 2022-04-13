/// @description Insert description here
// You can write your code in this editor



for (var p = 0; p < PLAYERS; p++;) {
	i = global.lookup[p];
	if (global.pressed[i][input.L])
	{
		room_goto(Room1);
	}
	if (global.pressed[i][input.U])
	{
		room_goto(Room2);
	}
	if (global.pressed[i][input.D])
		
	{
		room_goto(Room3);
	}
	if (global.pressed[i][input.R])
	{
		room_goto(Room4);
	}
	if (global.pressed[i][input.SE])
	{
		room_goto(Shot_Select);
		audio_play_sound(snd_parry,0,0);
	}
}


