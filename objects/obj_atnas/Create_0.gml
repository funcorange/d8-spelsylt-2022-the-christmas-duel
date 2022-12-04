/// @description Atnas creation
event_inherited();

// Weapon
weapon = instance_create_layer(x, y, "Weapons", obj_grenade_launcher);
weapon.owner = id;
