/// @description Insert description here
// You can write your code in this editor
if (!global.paused) {
	
if (global.hitstop <= 0) {

	if (timer < 0) instance_destroy();
	timer -= 0.1;
	if (timer < 0.6) image_alpha -= 0.2;
}
else {
	timer = 1;
	image_alpha = 1;
}

if (owner != noone) {
	if (owner.state != status.parry) {
		image_xscale = lerp(image_xscale, 0, 0.12);
		image_yscale = lerp(image_yscale, 0, 0.12);
		image_blend = owner.color;
	}
}

}