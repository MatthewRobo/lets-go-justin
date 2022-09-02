/// @description Insert description here
// You can write your code in this editor




select = false;
quit = 0;

if (!global.paused) {

	if (global.hitstop > 0) {
		global.hitstop --;
	}

	if (global.mode != gamemode.training) {
		
		if (totalframes > breakthrough) {
			breakthrough += breakthroughadd;
			var ftless = global.firstto - 1;
			audio_play_sound(snd_dies,0,0);
			switch global.mode {
				case gamemode.versus:
					if (obj_player1.deaths < ftless) {
						obj_player1.deaths++;
						for (i = 0; i < 20; i++) {
							var trail = instance_create_layer(obj_player1.x,obj_player1.y,"platforms",obj_splatter);
							trail.depth -= 2;
							trail.radius = random_range(1,5);
							trail.timer = random(i);

							trail.image_blend = irandom(3) ? global.color[0] : global.fgcolor2;
							trail.image_alpha = 0;
							var rdir = random(360);
			
							trail.speed = random(10);
							trail.direction = rdir;
							trail.friction = trail.speed / 30;
							var rlen = random_range(0,500);
							trail.alphainc = (1/rlen)*500/(30);
							trail.tx = room_width/2;
							trail.ty = 0;
						}
					}
					if (obj_player2.deaths < ftless) {
						obj_player2.deaths++;
						for (i = 0; i < 20; i++) {
							var trail = instance_create_layer(obj_player2.x,obj_player2.y,"platforms",obj_splatter);
							trail.depth -= 2;
							trail.radius = random_range(1,5);
							trail.timer = random(i);

							trail.image_blend = irandom(3) ? global.color[1] : global.fgcolor2;
							trail.image_alpha = 0;
							var rdir = random(360);
			
							trail.speed = random(10);
							trail.direction = rdir;
							trail.friction = trail.speed / 30;
							var rlen = random_range(0,500);
							trail.alphainc = (1/rlen)*500/(30);
							trail.tx = room_width/2;
							trail.ty = 0;
						}
					}
					break;
				case gamemode.teamvs:
					if (obj_player1.deaths+obj_player3.deaths < ftless) {
						obj_player1.deaths++;
					}
					if (obj_player2.deaths+obj_player4.deaths < ftless) {
						obj_player2.deaths++;
					}
					break;
			}
		}
		
		if (global.pmax == 4) {
			if (obj_player1.deaths + obj_player3.deaths >= global.firstto) {
				someonewon = true;
			}

			if (obj_player2.deaths + obj_player4.deaths >= global.firstto) {
				someonewon = true;
			}
		} else {
			if (obj_player1.deaths == global.firstto) && (obj_player2.deaths == global.firstto)
			&& obj_player1.dead && obj_player2.dead {
				global.firstto+=2;
				someonewon = false;
			} else {
				if (someonewon == false) {
					if (obj_player1.deaths >= global.firstto) {
						someonewon = true;
					}
					if (obj_player2.deaths >= global.firstto) {
						someonewon = true;
					}
					if (someonewon) {
						global.takess = true;
						show_debug_message("saved results");
						var file = file_text_open_append("1v1results.csv");
						var p1wins, p1shot, p2wins, p2shot, currentstage, roundtime, currenttime;
					
						p1wins = string(global.firstto - obj_player1.deaths);
						p2wins = string(global.firstto - obj_player2.deaths);
						p1shot = string(global.shots[0]);
						p2shot = string(global.shots[1]);
						currentstage = global.stagename;
						roundtime = string (seconds + ms / 100);
						currenttime = unix_timestamp();
						var stringarray = [p1wins, p1shot, p2wins, p2shot, currentstage, roundtime, currenttime];
						var _string = "";
						for (var i = 0; i < array_length(stringarray); i++) {
							_string += string(stringarray[i]);
							if (i < array_length(stringarray) - 1) _string += ",";
						}
						show_debug_message(_string);
						file_text_write_string(file, _string);
						file_text_writeln(file);
						file_text_close(file);
					}
				}
			}
		}
		
		if (someonewon) {
			with (obj_player) {
				if (!inputlock) {
					pausemenu = instance_create_depth(0,0,depth-1,obj_gameend);
					pausemenu.color = global.color[team];
					pausemenu.team = team;
					inputlock = true;
				}
			}
			
			ready = -1;
			readycount = 0;
			with (obj_gameend) {
				other.ready = max (other.ready, ready);
				if (ready != -1) other.readycount++;
				other.start[global.lookup[team]] = 0;
			}
			if (readycount >= instance_number(obj_gameend)) {
				switch ready {
					case 0: room_restart(); break;
					case 1: global.palette = randomize_palette();
					room_goto(Shot_Select); break; //"Change Shot",
					case 2: global.palette = randomize_palette();
					room_goto(Room_Select); break; //"Change Stage", 
					case 3: global.palette = randomize_palette();
					room_goto(Main_Menu); break; //"Quit to Menu"];
				}
			}
		}
	}

	roundfreeze--;
	if (roundfreeze <= 0) roundstart--;
	if (roundstart == 0) audio_play_sound(snd_spawn,0,0);
	if (global.mode != gamemode.training && ((global.hitstop <= 0 && !someonewon) || roundfreeze > 0)) totalframes++;
	seconds = totalframes div 60;
	frames = totalframes mod 60;
	ms = abs(frames / 60 * 100);
	
	tremain = breakthrough - totalframes;
	sremain = tremain div 60;
	fremain = tremain mod 60;
	msremain = abs(fremain / 60 * 100);
	
	roundratio = 1-(roundstart/roundinit);

	for (var device = 0; device < GP+KB; device++) {
		if (global.mode != gamemode.training) {
			if global.down[device][input.ST] {
				start[device] += 1/45;
			} else {
				start[device] = max(start[device] - 1/45, 0);
			}
			if global.down[device][input.SE] {
				select = true;
			} 
				
			
		} else {
			if (global.pressed[device][input.ST]) {
				start[device] += 2;
			} else {
				start[device] = max(start[device] - 1/45, 0);
			}
			if (global.pressed[device][input.SE]) {
				restart = 2;
			}
		}
	}


	if (select) restart+=1/45;
	else restart -=1/45;
}

if (restart < 0) restart = 0;

if (restart > 1) {
	room_restart();
}
for (var device = 0; device < GP+KB; device++) {
	if (start[device] > 1) {
		pausemenu = instance_create_depth(0,0,depth-1,obj_pausemenu);
		var _team = array_find_index(global.lookup, device);
		pausemenu.color = _team != -1 ? global.color[_team] : global.fgcolor2;
		pausemenu.team = _team;
		pausemenu.device = device;
		start[device] = 0;
		restart = 0;
	}
	quit = max(quit, start[device]);
}