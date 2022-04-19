/// @description Insert description here
// You can write your code in this editor

if (decay && global.hitstop <= 0) {
	tx[tcounter] = x;
	ty[tcounter] = y;
	tcounter++;
	tcounter = tcounter mod tlen;

	image_alpha -= 0.1;
	if (image_alpha < 0) instance_destroy();
}
