ini_open("bindings.ini");

for (d = 0; d < GP + KB; d++) {
	for (e = 0; e < 2; e++) {
		for (i = 0; i < input.length; i++) {
			var k = e == 0 ? "main" : "alt";
			var v = -1;
			switch i {
				case input.L: k += "Left"; break;
				case input.D: k += "Down"; break;
				case input.U: k += "Up"; break;
				case input.R: k += "Right"; break;
				case input.ST: k += "Start"; break;
				case input.SE: k += "Select"; break;
				case input.JU: k += "J"; break;
				case input.SL: k += "A"; break;
				case input.SH: k += "B"; break;
				case input.PA: k += "C"; break;
			}
			if (d < GP) {
				switch i {
					case input.L: v = gp_padl; break;
					case input.D: v = gp_padd; break;
					case input.U: v = gp_padu; break;
					case input.R: v = gp_padr; break;
					case input.ST: v = gp_start; break;
					case input.SE: v = e == 0 ? gp_select : gp_stickr; break;
					case input.JU: v = e == 0 ? gp_face1 : gp_shoulderl; break;
					case input.SL: v = e == 0 ? gp_face3 : gp_shoulderlb; break;
					case input.SH: v = e == 0 ? gp_face4 : gp_shoulderrb; break;
					case input.PA: v = e == 0 ? gp_face2 : gp_shoulderr; break;
				}
			} else if (!global.browser) {
				if (d == GP) {
					switch i {
						case input.L: v = ord("S"); break;
						case input.D: v = ord("D"); break;
						case input.U: v = ord("E"); break;
						case input.R: v = ord("F"); break;
						case input.ST: v = ord("Q"); break;
						case input.SE: v = ord("W"); break;
						case input.JU: v = ord("K"); break;
						case input.SL: v = ord("J"); break;
						case input.SH: v = ord("L"); break;
						case input.PA: v = vk_space; break;
					}
				} else if (d == GP+1) {
					switch i {
						case input.L: v = vk_left; break;
						case input.D: v = vk_down; break;
						case input.U: v = vk_up; break;
						case input.R: v = vk_right; break;
						case input.ST: v = vk_enter; break;
						case input.SE: v = vk_backspace; break;
						case input.JU: v = vk_numpad5; break;
						case input.SL: v = vk_numpad4; break;
						case input.SH: v = vk_numpad6; break;
						case input.PA: v = vk_numpad0; break;
					}
				}
			} else {
				if (d == GP) {
					switch i {
						case input.L: v = ord("A"); break;
						case input.D: v = ord("S"); break;
						case input.U: v = ord("W"); break;
						case input.R: v = ord("D"); break;
						case input.ST: v = ord("1"); break;
						case input.SE: v = ord("2"); break;
						case input.JU: v = ord("C"); break;
						case input.SL: v = ord("F"); break;
						case input.SH: v = ord("G"); break;
						case input.PA: v = ord("H"); break;
					}
				} else if (d == GP+1) {
					switch i {
						case input.L: v = ord("J"); break;
						case input.D: v = ord("K"); break;
						case input.U: v = ord("I"); break;
						case input.R: v = ord("L"); break;
						case input.ST: v = ord("7"); break;
						case input.SE: v = ord("8"); break;
						case input.JU: v = 186; break;
						case input.SL: v = 219; break;
						case input.SH: v = 221; break;
						case input.PA: v = 220; break;
					}
				}
			}
		if (!ini_key_exists(string(d), k)) ini_write_real(string(d), k, v);
		}
	}
}
ini_close();

ini_open("bindings.ini");

for (d = 0; d < GP + KB; d++) {
	for (e = 0; e < 2; e++) {
		for (i = 0; i < input.length; i++) {
			var k = e == 0 ? "main" : "alt";
			var v = -1;
			switch i {
				case input.L: k += "Left"; break;
				case input.D: k += "Down"; break;
				case input.U: k += "Up"; break;
				case input.R: k += "Right"; break;
				case input.ST: k += "Start"; break;
				case input.SE: k += "Select"; break;
				case input.JU: k += "J"; break;
				case input.SL: k += "A"; break;
				case input.SH: k += "B"; break;
				case input.PA: k += "C"; break;
			}
		if (e == 0) global.mainbind[d][i] = ini_read_real(d,k,-1);
		else global.subbind[d][i] = ini_read_real(d,k,-1);
		}
	}
}
ini_close();
