/// @DnDAction : YoYo Games.Audio.Play_Audio
/// @DnDVersion : 1
/// @DnDHash : 070C93F4
/// @DnDArgument : "soundid" "snd_land"
/// @DnDSaveInfo : "soundid" "snd_land"
audio_play_sound(snd_land, 0, 0);

/// @DnDAction : YoYo Games.Instances.Create_Instance
/// @DnDVersion : 1
/// @DnDHash : 007C9ADC
/// @DnDArgument : "xpos" "x"
/// @DnDArgument : "ypos" "y"
/// @DnDArgument : "objectid" "obj_boom"
/// @DnDArgument : "layer" ""Trails""
/// @DnDSaveInfo : "objectid" "obj_boom"
instance_create_layer(x, y, "Trails", obj_boom);