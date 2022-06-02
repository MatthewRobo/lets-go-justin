options = ["Music", "Palette", "Toggle Fullscreen", "Button Assign", "Close Settings"];
selected = 0;
o_len = array_length(options);
audio_play_sound(snd_parry,0,0);

lerpfactor = 0.2;
openlerp = 0;
selectedlerp = selected;

alphalerp = 0;

accepting = false;
alarm[0] = 2;

global.insettings = true;