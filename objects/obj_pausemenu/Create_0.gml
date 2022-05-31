global.paused = true;
options = ["Resume Game", "Restart Match", "Change Shot", "Change Stage", "Button Assign", "Quit to Menu"];
selected = 0;
o_len = array_length(options);
device = GP+KB;
team = -1;
color = global.fgcolor2;
audio_play_sound(snd_parry,0,0);

lerpfactor = 0.2;
openlerp = 0;
selectedlerp = selected;