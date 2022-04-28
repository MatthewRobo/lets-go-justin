pos = array_create(PLAYERS,input.length);
slot = array_create(GP+KB,-99);
ready = array_create(PLAYERS,false);
extra_options = 2;
total_options = input.length + extra_options;
lockout = true;
binding = array_create(2,false);
ini_open("bindings.ini");

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
		if (e == 0) global.mainbind[d][i] = ini_read_real(d,k,-1);
		else global.subbind[d][i] = ini_read_real(d,k,-1);
		}
	}
}
candestroy=false;
alarm[0]=10;
