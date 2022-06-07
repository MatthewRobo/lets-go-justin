gbid = layer_background_get_id("background");
layer_background_blend(gbid, global.bgcolor);

rooms = global.rooms;
roomlen = array_length(rooms);
previews = array_create(roomlen,spr_RoomBorder);
for (var i = 1; i < roomlen; i++) {
	var name = "spr_" + room_get_name(rooms[i]) + "Prev";
	var index = asset_get_index(name);
	if (index != -1) {
		previews[i] = index;
	}
}
roomstr = array_create(roomlen,"");
for (i = 0; i < roomlen; i++) {
	switch i {
		case 0: roomstr[i] = "Random"; break;
		case 1: roomstr[i] = "Wings"; break;
		case 2: roomstr[i] = "Bucket"; break;
		case 3: roomstr[i] = "Umpire"; break;
		case 4: roomstr[i] = "Chandeliers"; break;
		case 5: roomstr[i] = "Stadium"; break;
		case 6: roomstr[i] = "WarioWare"; break;
		case 7: roomstr[i] = "Shaft"; break;
		case 8: roomstr[i] = "3-E"; break;
		case 9: roomstr[i] = "Crosshair"; break;
		case 10: roomstr[i] = "Hump"; break;
		case 11: roomstr[i] = "Elevators"; break;
		case 12: roomstr[i] = "Teufort"; break;
		case 13: roomstr[i] = "Sloth"; break;
		case 14: roomstr[i] = "Hallways"; break;
		case 15: roomstr[i] = "Grid"; break;
		default: roomstr[i] = "UNNAMED"; break;
	}
}

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
