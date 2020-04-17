extends "res://Character.gd"

signal object_spawned
export(PackedScene) var cookie_scene

func action_1():
	print("Shoot with slingshot")
	for a in $ActionArea.get_overlapping_areas():
		if a.is_in_group("SecurityCam"):
			a.hit()
			return true
	
	return false
	

func action_2():
	print("Run super fast")
	movespeed = 20
	$RunTimer.start()
	return true
	



func _on_RunTimer_timeout():
	movespeed = 10
