extends Area


func _ready():
	connect("body_entered", self, "b")


func b(body):
	if body.is_in_group("Player"):
		catch()
		
func catch():
	print("You lost")


func hit():
	$AnimationPlayer.play("Rotator")