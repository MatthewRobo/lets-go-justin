//Enable the use of views
view_enabled = true;
//Make view 0 visible
view_set_visible(0, true);
//Set the port bounds of view 0 to 640x480
view_set_wport(0, room_width);
view_set_hport(0, room_height);

//Camera creation
//Build a camera at (0,0), with size 640x480, 0 degrees of angle, no target instance, instant-jupming hspeed and vspeed, with a 32 pixel border
camera = camera_create_view(0, 0, 1344, 768, 0, self, -1, -1, 5555, 5555);

//Set view0 to use the camera "camera"
view_set_camera(0, camera);

players = array_create(4,-4);

zoom_level = 1;
//Get the starting view size to be used for interpolation later
default_zoom_width = camera_get_view_width(view_camera[0]);
default_zoom_height = camera_get_view_height(view_camera[0]);
