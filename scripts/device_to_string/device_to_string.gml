// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function device_to_string(i){

		if (i < GP) {
			return gamepad_get_description(i);
		} else if (i < GP + KB) {
			return "Keyboard " + string(i mod KB + 1);
		} else {
			return "UNSET";
		}
}