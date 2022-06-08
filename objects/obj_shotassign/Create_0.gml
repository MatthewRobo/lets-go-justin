/// @description Insert description here
// You can write your code in this editor
global.hitstop = 0;
global.laststop = 0;
global.peakstop= 099999;
global.outline = global.textcolor;
global.firstto = -1;
ready = array_create(PLAYERS,false);
cols = 5;
rows = ceil(shot.length / cols);


			 
			 
iconframes = 0;


iconsize = 64;
iconscale = iconsize / 16;
icon_hgap = 64;
icon_vgap = 72;
icon_htotal = 0;
icon_vtotal = 0;
slant = 16;

gbid = layer_background_get_id("background");
layer_background_blend(gbid, global.bgcolor);

preview = array_create(4,noone);
for (var i = 0; i < global.pmax; i++) {
	var yspawn = 700;
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
	if (global.mode == gamemode.teamvs) {
		switch i {
			case 0: preview[i].teamstr = "2"; break;
			case 1: preview[i].teamstr = "3"; break;
			case 2: preview[i].teamstr = "1"; break;
			case 3: preview[i].teamstr = "4"; break;
		}
	} else {
		preview[i].teamstr = string(i+1);

	}
}

px = array_create(4,room_width/2);
py = array_create(4,room_height/2);
_px = array_create(4,room_width/2);
_py = array_create(4,room_height/2);
lerpfactor = 0.05;

ydraw_icon = 128;

audio_play_sound(snd_parry,0,0);
