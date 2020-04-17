extends "res://Character.gd"

signal object_spawned
export(PackedScene) var cookie_scene


var ab_name_1 = "Cookie"
var ab_name_2 = "Hack"

func action_1():
	var c = cookie_scene.instance()
	c.global_transform.origin =  global_transform.origin
	emit_signal("object_spawned", c)
	return true
	

func action_2():
	for a in $ActionArea.get_overlapping_areas():
		if a.is_in_group("Computer"):
			a.hack()
			return true
	return false
