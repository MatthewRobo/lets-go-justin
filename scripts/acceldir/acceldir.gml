// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function acceldir(len, dir, use_built_in = false) {
	var _hsp = use_built_in ? hspeed : hsp;
	var _vsp = use_built_in ? vspeed : vsp;
	_hsp += lengthdir_x(len,dir);
	_vsp += lengthdir_y(len,dir);
	
	if (use_built_in) {
		hspeed = _hsp;
		vspeed = _vsp;
	} else {
		hsp = _hsp;
		vsp = _vsp;
	}
}