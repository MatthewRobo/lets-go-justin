var inbattle = false;
for (i = 0; i < array_length(global.rooms); i++) {
	if (global.rooms[i] == room) inbattle = true;
}
if (inbattle) {
	audio_stop_sound(nowplaying);
	nowplaying = audio_play_sound(battlemus[irandom(array_length(battlemus)-1)],1,1);
}

if (room == Room_Select) {
	audio_stop_sound(nowplaying);
	nowplaying = audio_play_sound(menumus[irandom(array_length(menumus)-1)],1,1);
}
