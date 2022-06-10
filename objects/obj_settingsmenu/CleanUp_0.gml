
ini_open("settings.ini");

ini_write_real("Settings", "MusicVolume", global.musicgain);
ini_write_real("Settings", "Palette", global.palettelock ? global.palette : -1);


ini_close();