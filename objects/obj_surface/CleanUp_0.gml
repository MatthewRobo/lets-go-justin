surface_free(surf);
surface_free(scanline);
surface_free(mask);
surface_free(glitter);

if (global.mode == gamemode.versus) {
	surface_save(death_log,"stage_deaths/" + string(unix_timestamp()) + "_" + global.stagename + ".png");
}
surface_free(death_log);