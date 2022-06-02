/// @description Insert description here
// You can write your code in this editor

global.inassign = true;

// lockout until no one is pressing a button
for (var device = 0; device < GP+KB; device++) {
	for (var p = 0; p < PLAYERS; p++) {
		if (device == global.lookup[p]) {
			slot[device] = p;
		}
	}
}
if (lockout || !candestroy) {
	for (var d = 0; d < GP; d++) {
		buttonsheld = 0;
		show_debug_message(buttonsheld);
		for (i = gp_face1; i < gp_padr + 1; i++) {
				if (gamepad_button_check(d,i)) buttonsheld++;
		}
		if (buttonsheld <= 0) lockout = false;	
	}
} else {
	for (var device = 0; device < GP+KB; device++) {
		for (var j = 0; j < input.length; j++) {
			if global.pressed[device][j] || device == GP || device == GP+1{
				if (slot[device] == -99) {
					slot[device] = -1;
					audio_play_sound(snd_jump,0,0);
				}
			}
		}
		if !binding[device] && global.pressed[device][input.L] {
			switch slot[device]{
				case -1: 
					oldside = slot[device];
					newside = 0;
					slot[device] = newside;
					swapdevice = global.lookup[newside];
					global.lookup[newside] = device;
					slot[swapdevice] = oldside;
					ready[newside]=false;
					pos[newside] = 10;
					break;
				case -2: 
					oldside = slot[device];
					newside = 2;
					slot[device] = newside;
					swapdevice = global.lookup[newside];
					global.lookup[newside] = device;
					slot[swapdevice] = oldside;
					ready[newside]=false;
					pos[newside] = 10;
					break;
				case 1:
					slot[device] = -1;
					global.lookup[1] = GP+KB;
					break;
				case 3:
					slot[device] = -2;
					global.lookup[3] = GP+KB;
					break;
			}
			//if (slot[device] >= 0) pos[slot[device]] = 10;
		}
		if !binding[device] && global.pressed[device][input.R] {
			switch slot[device]{
				case -1: 
					oldside = slot[device];
					newside = 1;
					slot[device] = newside;
					swapdevice = global.lookup[newside];
					global.lookup[newside] = device;
					slot[swapdevice] = oldside;
					ready[newside]=false;
					pos[newside] = 10;
					break;
				case -2: 
					oldside = slot[device];
					newside = 3;
					slot[device] = newside;
					swapdevice = global.lookup[newside];
					global.lookup[newside] = device;
					slot[swapdevice] = oldside;
					ready[newside]=false;
					pos[newside] = 10;
					break;
				case 0:
					slot[device] = -1;
					global.lookup[0] = GP+KB;
					break;
				case 2:
					slot[device] = -2;
					global.lookup[2] = GP+KB;
					break;
			}
			//if (slot[device] >= 0) pos[slot[device]] = 10;
		}
		if global.pressed[device][input.D] && slot[device] == -1 {
			slot[device] = -2;
		}
		if global.pressed[device][input.U] && slot[device] == -2 {
			slot[device] = -1;
		}
		//if global.pmax != 4 {
		//	if (slot[device] >= 2 || slot[device] == -2) {
		//		slot[device] = -1;
		//	}
		//}
		

	}
	for (var p = 0; p < PLAYERS; p++;)
	{
		var device = global.lookup[p]; // d for DEVICE
		if (!ready[p]) {
			if (pos[p] >3) binding[device] = false;
			if global.pressed[device][input.U] && !binding[device]{
				pos[p]--;
			}
			if global.pressed[device][input.D] && !binding[device]{
				pos[p]++;
			}
			pos[p] = (pos[p] + total_options) mod total_options;
			if (device >= GP && device < GP+KB && keyboard_check_pressed(vk_anykey) && keyboard_key != vk_f1 && keyboard_key != vk_f2) {
				if (binding[device] && pos[p] <= 3) {
					global.mainbind[device][pos[p]] = keyboard_key;
					global.subbind[device][pos[p]] = keyboard_key;
					pos[p]++;
				}
				if (keyboard_check_pressed(vk_anykey)
				&& keyboard_key != global.mainbind[device][input.U] && keyboard_key != global.mainbind[device][input.D]
				&& keyboard_key != global.mainbind[device][input.L] && keyboard_key != global.mainbind[device][input.R]) {
					if (pos[p] <= 3 && keyboard_key == global.mainbind[device][input.ST]) {
						binding[device] = true;
					}
					if (pos[p] > 3 && pos[p] < input.length) {
						binding[device] = true;
						global.mainbind[device][pos[p]] = keyboard_key;
						global.subbind[device][pos[p]] = keyboard_key;
						if (pos[p] < input.SE) pos[p]++;
					} else {
						if (pos[p] >=input.length) binding[device] = false;
						if (pos[p] == input.length + 1) {
							if (keyboard_key == global.mainbind[device][input.ST]) {
								var d = device;
								for (var e = 0; e < 2; e++) {
									for (var i = 0; i < input.length; i++) {
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
										if (e == 0) global.mainbind[device][i] = v;
										else global.subbind[device][i] = v;
									}
								}
							}
						}
					}
				}
			}
			for (var button = 4; button < input.length; button++) {
				if (pos[p] == input.length && global.pressed[device][button]) {
					ready[p] = true;
				}
			}

			
			for (var button = gp_face1; button < gp_axisrv; button++) {
				if (gamepad_button_check_pressed(device, button)
				&& (button == gp_face1 ||
					button == gp_face2 ||
					button == gp_face3 ||
					button == gp_face4 ||
					button == gp_shoulderl ||
					button == gp_shoulderlb ||
					button == gp_shoulderr ||
					button == gp_shoulderrb ||
					button == gp_select ||
					button == gp_start ||
					button == gp_stickl ||
					button == gp_stickr ))  {
					if (pos[p] > 3 && pos[p] < input.length) {
						global.mainbind[device][pos[p]] = button;
						global.subbind[device][pos[p]] = button;
						if (pos[p] < input.SE) pos[p]++;
						exit;
					}
					if (pos[p] == input.length) {
						ready[p] = true;
					}
					if (pos[p] == input.length + 1
						&& (button == gp_face1 ||
						button == gp_face2 ||
						button == gp_face3 ||
						button == gp_face4 ||
						button == gp_shoulderl ||
						button == gp_shoulderlb ||
						button == gp_shoulderr ||
						button == gp_shoulderrb ||
						button == gp_select ||
						button == gp_start ||
						button == gp_stickl ||
						button == gp_stickr )) {
						show_debug_message("reset to default");
						var d = device;
						for (var e = 0; e < 2; e++) {
							for (var i = 0; i < input.length; i++) {
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
								if (e == 0) global.mainbind[device][i] = v;
								else global.subbind[device][i] = v;
							}
						}
					}
				}
			}
		}
	}
}

for (var i = 0; i < PLAYERS; i++) {
	if (global.lookup[i] < GP+KB && ready[i]) {
		for (var j = 0; j < PLAYERS; j++) {
			if (global.lookup[j] == GP+KB) ready[j]=true;
		}
	}
}

if (ready[0] && ready[1] && ready[2] && ready[3]) instance_destroy();
