extends "res://Character.gd"

signal object_spawned
export(PackedScene) var cookie_scene

func action_1():
	print("action 1 is op")
	var c = cookie_scene.instance()
	c.global_transform =  global_transform.origin
	emit_signal("object_spawned", c)
	

func action_2():
	print("hit guard with handbag")
