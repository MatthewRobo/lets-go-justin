gbid = layer_background_get_id("background");
layer_background_blend(gbid, global.bgcolor);

rooms = [-1,Room1,Room2,Room3,Room4,Room5,Room6];
roomlen = array_length(rooms);
previews = [spr_RoomBorder,spr_Room1Prev,spr_Room2Prev,spr_Room3Prev,spr_Room4Prev,spr_Room5Prev,spr_Room6Prev];
selected = 0;
lerpfactor = 0.05;
selectedlerp = 0;
prevsize = room_width/8;
prevscale = prevsize/room_width;
prevgap = 10;

zoomsize = room_width / 1.5;
zoomscale = zoomsize / room_width;
zoomgap = (room_width-zoomsize)/2+10;

ydraw = room_height-prevsize/2;
ydraw_large = ydraw/2;
