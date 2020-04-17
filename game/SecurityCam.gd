extends Area

signal caught

var cancatch = true
func _ready():
	$Spot.connect("body_entered", self, "b")


func b(body):
	if body.is_in_group("Player") and cancatch:
		emit_signal("caught",body,name)
		catch()
		
func catch():
	
	print("You lost")


func hit():
	cancatch = false
	$Sprite/Light.light_energy = 0.3
	$AnimationPlayer.play("Rotator")
	
func reset():
	hit()
	$Sprite/Light.light_energy = 1
	cancatch = true
	$AnimationPlayer.seek(0,true)
	$AnimationPlayer.stop(true)


func _on_AnimationPlayer_animation_finished(anim_name):
	$Sprite/Light.light_energy = 1
	cancatch = true
