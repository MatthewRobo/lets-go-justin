/// @description Insert description here
// You can write your code in this editor
if (global.hitstop <= 0) {
	
if (image_alpha >= -1) {
	image_alpha -= 1.01/(obj_player.slashactive + 1);
} else {
	instance_destroy();
}

}
else image_alpha = 1;