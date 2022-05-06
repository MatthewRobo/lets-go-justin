gbid = layer_background_get_id("background");
layer_background_blend(gbid, global.bgcolor);

modes = [gamemode.versus, gamemode.teamvs, gamemode.training];
modelen = array_length(modes);
modestr = ["Versus", "Team VS", "Training"];
selected = global.mode;
lerpfactor = 0.2;
selectedlerp = global.mode;

palette = irandom(11);
audio_play_sound(snd_parry,0,0);

xgap = 10;
xwid = 240;
pgap = xgap;
