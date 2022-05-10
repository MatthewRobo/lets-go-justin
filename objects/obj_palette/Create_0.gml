#macro PALETTES 12
enum menubgs {
	wave,
	rectangle,
	length
}

global.palette = irandom(PALETTES-1);
global.color[0] = $5100ff;
global.color[1] = $ff8000;
global.color[2] = $0051ff;
global.color[3] = $ffcc00;
global.bgcolor = $1d1616;
global.fgcolor = $694f4f;
global.fgcolor2 = $99ccff;
global.menubg = irandom(menubgs.length-1);
