/// @description Insert description here
// You can write your code in this editor
global.hitstop = 0;
global.outline = c_white;
global.firstto = -1;
ready = array_create(PLAYERS,false);
cols = 4;
rows = shot.length div cols + 1;


gbid = layer_background_get_id("background");
layer_background_blend(gbid, global.bgcolor);

preview = array_create(4,noone);
for (var i = 0; i < global.pmax; i++) {
	var yspawn = room_height*.75;
	j = 0;
	switch i {
		case 0: j = 1; break;
		case 1: j = 2; break;
		case 2: j = 0; break;
		case 3: j = 3; break;
	}
	var xspawn = room_width / 4 * (j + 0.5);
	preview[i] = instance_create_layer(xspawn,yspawn,"players",obj_playerpreview);
	preview[i].team = i;
	with (preview[i]) {
		event_perform(ev_room_start,0);
	}
}


