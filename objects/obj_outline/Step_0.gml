/// @description Insert description here
// You can write your code in this editor
_w2 = w0;
w2 = _w2+ global.hitstop / 2;
lerpfactor = _lerpfactor + global.hitstop / 10;

x11 = lerp(x11, _x1 - random_range(w1,w2), lerpfactor);
x12 = lerp(x12, _x1 - random_range(w1,w2), lerpfactor);
x21 = lerp(x21, _x2 + random_range(w1,w2), lerpfactor);
x22 = lerp(x22, _x2 + random_range(w1,w2), lerpfactor);
y11 = lerp(y11, _y1 - random_range(w1,w2), lerpfactor);
y12 = lerp(y12, _y1 - random_range(w1,w2), lerpfactor);
y21 = lerp(y21, _y2 + random_range(w1,w2), lerpfactor);
y22 = lerp(y22, _y2 + random_range(w1,w2), lerpfactor);

