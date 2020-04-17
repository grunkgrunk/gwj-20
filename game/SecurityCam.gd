extends Area

signal caught
func _ready():
	$Spot.connect("body_entered", self, "b")


func b(body):
	if body.is_in_group("Player"):
		emit_signal("caught",body,name)
		catch()
		
func catch():
	
	print("You lost")


func hit():
	$AnimationPlayer.play("Rotator")
	
func reset():
	$AnimationPlayer.seek(0,true)
	$AnimationPlayer.stop(true)
