gbid = layer_background_get_id("background");
layer_background_blend(gbid, global.bgcolor);

if (!global.browser) {
	modes = [gamemode.versus, gamemode.teamvs, gamemode.training, -1];
	modestr = ["Versus", "Team VS", "Training", "Quit"];
} else {
	modes = [gamemode.versus, gamemode.training];
	modestr = ["Versus", "Training"];
}
modelen = array_length(modes);
selected = global.mode;
lerpfactor = 0.2;
selectedlerp = global.mode;

palette = irandom(11);
audio_play_sound(snd_parry,0,0);

xgap = 10;
xwid = 240;
pgap = xgap;

expanded = 0;
openlerp = 0;
ybegin = 420;
