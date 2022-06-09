//if !global.browser{
inbattle = false;
for (var i = 0; i < array_length(global.rooms); i++) {
	if (global.rooms[i] == room) inbattle = true;
}
if (inbattle) {
	var next = irandom(array_length(battlemus)-1);
	
	if (audio_get_name(nowplaying) != audio_get_name(battlemus[next])) 
		{
			audio_stop_sound(nowplaying);
			if (global.musicgain > 0) nowplaying = audio_play_sound(battlemus[next],1,1);
		}
} else {
	var hasamenusongplaying = false;
	for (var i = 0; i < array_length(menumus); i++) {
		if (audio_get_name(nowplaying)== audio_get_name(menumus[i])) {
			hasamenusongplaying = true;
		}
	}
	if !hasamenusongplaying {
		audio_stop_sound(nowplaying);
		//if (global.musicgain > 0) nowplaying = audio_play_sound(menumus[irandom(array_length(menumus)-1)],1,0);
		if (global.musicgain > 0) nowplaying = audio_play_sound(menumus[0],1,0);
	}
}

someonewon = false;

for (var i = 0; i < array_length(menumus); i++) {
	if (audio_get_name(nowplaying) == audio_get_name(menumus[i])) {
		volscl = menuvol[i];
	}
}

for (var i = 0; i < array_length(battlemus); i++) {
	if (audio_get_name(nowplaying) == audio_get_name(battlemus[i])) {
		volscl = battlevol[i];
	}
}
//}
