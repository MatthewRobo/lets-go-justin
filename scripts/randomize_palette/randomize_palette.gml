// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function randomize_palette(){
	if !global.palettelock {
		var _palette = global.palette;
		var _palettes = array_create(PALETTES-1,0);
		var c = 0;
		for (var i = 0; i < PALETTES; i++) {
			if (i != _palette) _palettes[c] = i;
			c++;
		}
		global.palette = _palettes[irandom(PALETTES-2)];
	}
	return global.palette;
}