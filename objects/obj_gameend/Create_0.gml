options = ["Rematch", "Change Shot", "Change Stage", "Main Menu"];
selected = 0;
ready = -1;
o_len = array_length(options);
team = -1;
color = global.fgcolor2;

lerpfactor = 0;
openlerp = 0;
selectedlerp = selected;

hidden = 0;
alphalerp = 0;

accepting = false;
alarm[0] = 120;