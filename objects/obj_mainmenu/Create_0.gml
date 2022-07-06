gbid = layer_background_get_id("background");
layer_background_blend(gbid, global.bgcolor);

if (!global.browser) {
	modes = [gamemode.versus, gamemode.teamvs, gamemode.training,-2, -1];
	modestr = ["Versus", "Team VS", "Training", "Settings" , "Quit"];
} else {
	modes = [gamemode.versus, gamemode.training,-2];
	modestr = ["Versus", "Training","Settings"];
}
modelen = array_length(modes);
selected = array_find_index(modes,global.mode);
lerpfactor = 0.2;
selectedlerp = global.mode;

audio_play_sound(snd_shoot,0,0);
dies = audio_play_sound(snd_dies,0,0);
audio_sound_pitch(dies,0.2);

xgap = 10;
xwid = 240;
pgap = xgap;

expanded = 0;
openlerp = -1;
openlerp = 0;
ybegin = 420;
ygap = 6;
breathing = 0;
breath = 0;

frame = 0;
