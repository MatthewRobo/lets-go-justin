gbid = layer_background_get_id("background");
layer_background_blend(gbid, global.bgcolor);

rooms = global.rooms;
roomlen = array_length(rooms);
previews = [spr_RoomBorder,
            spr_Room1Prev,
			spr_Room2Prev,
			spr_Room3Prev,
			spr_Room4Prev,
			spr_Room5Prev,
			spr_Room6Prev,
			spr_Room7Prev,
			spr_Room8Prev,
			spr_Room9Prev,
			spr_Room10Prev,
			spr_Room11Prev,
			spr_Room12Prev];
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
		   "Horseshoes",
		   "Teufort"];
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
