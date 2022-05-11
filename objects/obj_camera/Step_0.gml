/// @description Insert description here
// You can write your code in this editor
//xprev = x;
//yprev = y;
//x = 0;
//y = 0;

//zoom_level = 1;

//var i;
//for (var i = 0; i < instance_number(obj_player); ++i;)
//{
//	players[i] = instance_find(obj_player,i);
//	target = players[i];
//	//if (target.dead) {
//	//	target = target.spawnpoint;
//	//}
		
//	x += target.x;
//	y += target.y;
//}
//var lerpfactor = 0.1;

//if (global.hitstop > 0) zoom_level = 0.95;
//x = lerp(xprev,x/i,lerpfactor);
//y = lerp(yprev,y/i,lerpfactor);

//zoom_level = clamp(zoom_level, 0.1, 5);
//zoom_level = max((clamp(abs(obj_player1.x - obj_player2.x),720,room_width)+128) / default_zoom_width,
//(clamp(abs(obj_player1.y - obj_player2.y),540,room_height)) / default_zoom_height);
////Get current size
//var view_w = camera_get_view_width(view_camera[0]);
//var view_h = camera_get_view_height(view_camera[0]);
////Set the rate of interpolation
//var rate = 0.05;
////Get new sizes by interpolating current and target zoomed size
//var new_w = lerp(view_w, zoom_level * default_zoom_width, rate);
//var new_h = lerp(view_h, zoom_level * default_zoom_height, rate);
////Apply the new size
//camera_set_view_size(view_camera[0], new_w, new_h);

x = room_width / 2;
y = room_height / 2;
