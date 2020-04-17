extends Sprite3D
signal caught

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


func start():
	$Timer.start()

func _on_Area_body_entered(body):
	if body.is_in_group("Player"):
		emit_signal("caught",body,name)


func _on_Timer_timeout():
	pass # Replace with function body.
