/// @description Insert description here
// You can write your code in this editor

pads = "";

for (var i = 0; i < global.gpnum; i++;)
{
		pads += string(global.gp[i]) + "\n";
}


for (var p = 0; p < PLAYERS; p++) {
	for (var i = 0; i < INPUTS; i++) {
		global.last[p][i] = global.down[p][i];
		if (p == 0) {
			switch i {
				case input.L: global.down[0][input.L] = keyboard_check(ord("S"));
					break;
				case input.D: global.down[0][input.D] = keyboard_check(ord("D"));
					break;
				case input.U: global.down[0][input.U] = keyboard_check(ord("E"));
					break;
				case input.R: global.down[0][input.R] = keyboard_check(ord("F"));
					break;
				case input.ST: global.down[0][input.ST] = keyboard_check(ord("Q"));
					break;
				case input.SE: global.down[0][input.SE] = keyboard_check(ord("W"));
					break;
				case input.JU: global.down[0][input.JU] = keyboard_check(ord("K"));
					break;
				case input.SL: global.down[0][input.SL] = keyboard_check(ord("J"));
					break;
				case input.SH: global.down[0][input.SH] = keyboard_check(ord("L"));
					break;
				case input.PA: global.down[0][input.PA] = keyboard_check(vk_space);
					break;
			}
		}
		global.pressed[p][i] = global.down[p][i] && !global.last[p][i];
		global.released[p][i] = !global.down[p][i] && global.last[p][i];
	}
}


