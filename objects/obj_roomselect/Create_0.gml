gbid = layer_background_get_id("background");
layer_background_blend(gbid, global.bgcolor);

rooms = global.rooms;
roomlen = array_length(rooms);
previews = array_create(roomlen,spr_RoomBorder);
for (var i = 1; i < roomlen; i++) {
	var name = "spr_" + room_get_name(rooms[i]) + "Prev";
	var index = asset_get_index(name);
	if (index != undefined) {
		previews[i] = index;
	}
}
roomstr = ["Random",
           "Wings",
		   "Bucket",
		   "Umpire",
		   "Chandeliers",
		   "Stadium",
		   "WarioWare",
		   "Shaft",
		   "3-E",
		   "Crosshair",
		   "Hump",
		   "Elevators",
		   "Teufort",
		   "Test13",
		   "Test14"];
lerpfactor = 0.18;
selected = global.stageindex;
selectedlerp = selected;
prevsize = room_width/roomlen;
prevscale = prevsize/room_width;
prevgap = -prevsize;

zoomsize = room_width / 1.5;
zoomscale = zoomsize / room_width;
zoomgap = -zoomsize;

ydraw = room_height-prevsize*0.75;
ydraw_large = ydraw/2;


if (global.mode == gamemode.training) audio_play_sound(snd_parry,0,0);

banlerp = array_create(roomlen,0);
