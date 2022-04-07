/// @DnDAction : YoYo Games.Instances.Destroy_Instance
/// @DnDVersion : 1
/// @DnDHash : 692BF263
/// @DnDApplyTo : other
with(other) instance_destroy();

/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 2D95F04F
/// @DnDArgument : "expr" "4"
/// @DnDArgument : "var" "global.hitstop"
global.hitstop = 4;

/// @DnDAction : YoYo Games.Instances.Create_Instance
/// @DnDVersion : 1
/// @DnDHash : 3A2ECFA4
/// @DnDApplyTo : other
/// @DnDArgument : "xpos" "x"
/// @DnDArgument : "ypos" "y"
/// @DnDArgument : "objectid" "obj_boom"
/// @DnDArgument : "layer" ""ParryFX""
/// @DnDSaveInfo : "objectid" "obj_boom"
with(other) {
	instance_create_layer(x, y, "ParryFX", obj_boom); 
}