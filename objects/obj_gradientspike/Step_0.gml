if (!global.paused) {
	
if (global.hitstop <= 0) {

if (image_alpha >= 0) {
	image_alpha -= 0.1;
} else {
	instance_destroy();
}

}
else image_alpha = 1;

}