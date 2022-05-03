/// @description Insert description here
// You can write your code in this editor

if (global.hitstop <= 0) {
	xprev = x;
	yprev = y;
	travel = noone;
	timer--;
	if (timer <= 0) instance_destroy();
	lifetime++;
	var nextdist;
	var _list = ds_list_create();
	var _num = collision_line_list(x,y,x+hsp,y+vsp, obj_player, false, true, _list, true);
	if _num > 0
	{
	    for (var i = 0; i < _num; ++i;)
	    {
			target = _list[|i]
			if (target.team != team && target.invul <= 0)
			&& !place_meeting(x+hsp,y+vsp,target) {
				travel = target;
				nextdist = point_distance(x,y,travel.x,travel.y);
				break;
			}
	    }
	}
	ds_list_destroy(_list);

	if (travel != noone) {
		disttravel = 0;
		dir = point_direction(0,0,hsp,vsp);
		_hsp = lengthdir_x(1,dir);
		_vsp = lengthdir_y(1,dir);
		while (disttravel < nextdist) {
			x += _hsp;
			y += _vsp;
			disttravel++;
		}
	} else {
		x += hsp;
		y += vsp;
	}
}
spd = point_distance(00,0,hsp,vsp);
if (spd > 0) direction=point_direction(0,0,hsp,vsp);
