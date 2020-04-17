extends "res://Character.gd"

signal object_spawned
export(PackedScene) var cookie_scene

var ab_name_1 = "Slingshot"
var ab_name_2 = "Sprint"

var has_treasure = false

func _ready():
	#._ready()
	$Position3D/Treasure.hide()
	$TreasureArea.connect("area_entered", self, "_on_area_entered")

func _on_area_entered(a):
	if a.is_in_group("Treasure") and not has_treasure:
		a.take()
		has_treasure = true
		$Position3D/Treasure.show()


func reset():
	has_treasure = false
	$Position3D/Treasure.hide()
	.reset()

func action_1():
	print("Shoot with slingshot")
	for a in $ActionArea.get_overlapping_areas():
		if a.is_in_group("SecurityCam"):
			a.hit()
			return true
	
	return false
	

func action_2():
	print("Run super fast")
	movespeed = 25
	$RunTimer.start()
	return true
	



func _on_RunTimer_timeout():
	movespeed = 12
