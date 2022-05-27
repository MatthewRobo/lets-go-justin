if (other.object_index != obj_coin) team = other.team;
if (lasthit != other && cooldown <= 0) {
	lasthit = other;
	
	var pdist = 128000;
	
	for (var i = 0; i < instance_number(obj_player); ++i;)
	{
		var enemy = instance_find(obj_player,i);
		if (enemy.team != team) {
			if (point_distance(x,y,enemy.x,enemy.y) < pdist) {
				pdist = point_distance(x,y,enemy.x,enemy.y);
				direction = point_direction(x,y,enemy.x,enemy.y);
			}
		}
	}
	grav = 0;
	spd = maxspd;
	hsp = lengthdir_x(spd, direction);
	vsp = lengthdir_y(spd, direction);
	x += hsp;
	y += vsp;
	global.hitstop = max(9,global.hitstop);
	instance_create_layer(x, y, "ParryFX", obj_boom);
	audio_play_sound(snd_dink,0,0);
	image_xscale = 0.5;
	image_yscale = 0.5;
	cooldown = 2;
}
