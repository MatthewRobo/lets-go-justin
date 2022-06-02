#macro PALETTES 17
enum thingies {
	wave,
	rectangle,
	length
}

global.palette = irandom(PALETTES-1);
global.palettelock = false;
global.color[0] = $5100ff;
global.color[1] = $ff8000;
global.color[2] = $0051ff;
//global.color[3] = $cccc00;
global.color[3] = $ffcc00;
//global.bgcolor = $09121f;
//global.fgcolor = $445566;
//global.bgcolor = $222222;
global.bgcolor = $1d1616;
//global.fgcolor = $3f3f3f;
global.fgcolor = $694f4f;
global.fgcolor2 = $99ccff;
global.thingy = irandom(thingies.length-1);
