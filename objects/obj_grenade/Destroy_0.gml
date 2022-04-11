/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

for (i = 0; i < 360; i += 45) {
		attack = instance_create_layer(x, y, "hitboxes", obj_bullet);
		attack.owner = owner;
		attack.team = team;
		attack.direction = i;
		attack.spd = 12;
		attack.hsp = lengthdir_x(attack.spd, attack.direction);
		attack.vsp = lengthdir_y(attack.spd, attack.direction);
		attack.timer = 4;
}
