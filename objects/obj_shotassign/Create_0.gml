/// @description Insert description here
// You can write your code in this editor
global.hitstop = 0;
global.outline = c_white;
global.firstto = -1;
ready = array_create(PLAYERS,false);
cols = 4;
rows = shot.length div cols;

shotspr = [spr_marksman,
             spr_shotgun,
             spr_whip,
             spr_flicker,
             spr_wallbang,
             spr_trailer,
             spr_beam,
             spr_grenade,
             spr_booster,
			 spr_geyser,
             spr_trig,
             spr_anarchy];

shotstr = ["Marksman",
             "Shotgun",
			 "Whip",
			 "Flicker",
			 "Wallbanger",
			 "Wall",
			 "Beam",
			 "Grenade",
			 "Booster",
			 "Geyser",
			 "Trig",
			 "Anarchy"];
			 
iconframes = 0;


iconsize = 64;
iconscale = iconsize / 16;
icon_hgap = 104;
icon_vgap = 72;
icon_htotal = iconsize+icon_hgap;
icon_vtotal = iconsize+icon_vgap;

gbid = layer_background_get_id("background");
layer_background_blend(gbid, global.bgcolor);

preview = array_create(4,noone);
for (var i = 0; i < global.pmax; i++) {
	var yspawn = 720;
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


