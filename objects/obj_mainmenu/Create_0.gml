gbid = layer_background_get_id("background");
layer_background_blend(gbid, global.bgcolor);

modes = [gamemode.versus, gamemode.teamvs, gamemode.training];
modelen = array_length(modes);
modestr = ["Versus", "Team VS", "Training"];
selected = 0;
lerpfactor = 0.2;
selectedlerp = 0;
prevgap = 20;

palette = irandom(11);
