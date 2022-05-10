gbid = layer_background_get_id("background");
layer_background_blend(gbid, global.bgcolor);

if (!global.browser) {
	modes = [gamemode.versus, gamemode.teamvs, gamemode.training,-2, -1];
	modestr = ["Versus", "Team VS", "Training", "Music" , "Quit"];
} else {
	modes = [gamemode.versus, gamemode.training];
	modestr = ["Versus", "Training"];
}
modelen = array_length(modes);
selected = global.mode;
lerpfactor = 0.2;
selectedlerp = global.mode;

audio_play_sound(snd_parry,0,0);

xgap = 10;
xwid = 240;
pgap = xgap;

expanded = 0;
openlerp = 0;
ybegin = 420;
ygap = 6;
breathing = 0;
breath = 0;

frame = 0;
