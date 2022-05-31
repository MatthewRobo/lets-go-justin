for (var d = 0; d < GP + KB; d++) {
	for (var e = 0; e < 2; e++) {
		for (var i = 0; i < input.length; i++) {
			var k = e == 0 ? "main" : "alt";
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
			var v = e == 0 ? global.mainbind[d][i] : global.subbind[d][i];
			ini_write_real(string(d), k, v);
		}
	}
}

ini_close();

global.inassign = false;