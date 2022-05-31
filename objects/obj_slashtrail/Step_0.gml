if (!global.paused) {
	
if (global.hitstop <= 0) {
	
if (image_alpha >= -1) {
	image_alpha -= 1.01/(obj_player.slashactive + 1);
} else {
	instance_destroy();
}

}
else image_alpha = 1;

}