global.paused = true;

if (!global.inassign) {
	if (global.pressed[device][input.U]) selected--;
	if (global.pressed[device][input.D]) selected++;
	selected = intwrap(selected, 0, o_len);
	if (global.pressed[device][input.ST] || global.pressed[device][input.SL]) {
		switch selected {
			case 0: 
			instance_destroy(); break; //["Resume Game"
			case 1: 
			room_restart(); break; //"Restart Match"
			case 2: global.palette = irandom(PALETTES-1);
			room_goto(Shot_Select); break; //"Change Shot",
			case 3: global.palette = irandom(PALETTES-1);
			room_goto(Room_Select); break; //"Change Stage", 
			case 4: 
			instance_create_depth(0,0,-10000,obj_inputassign); break;//"Button Assign", 
			case 5: global.palette = irandom(PALETTES-1);
			room_goto(Main_Menu); break; //"Quit to Menu"];
		}
	}
	if (global.pressed[device][input.SE] || global.pressed[device][input.SH]) {
			instance_destroy(); 
	}
}

