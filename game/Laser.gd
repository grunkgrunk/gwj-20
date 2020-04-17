extends Sprite3D
signal caught

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var cancatch = true

func start():
	cancatch = false
	$Timer.start()
	hide()

func _on_Area_body_entered(body):
	if body.is_in_group("Player") and cancatch:
		emit_signal("caught",body,name)


func _on_Timer_timeout():
	show()
	cancatch = true
