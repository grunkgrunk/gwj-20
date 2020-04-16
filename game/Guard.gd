extends Node2D


export(float) var movespeed = 10
signal caught

var aware

# Called when the node enters the scene tree for the first time.
func _ready():
	aware = true
	reset()


func _on_Guard_body_entered(body):
	if body.is_in_group("Actor") and aware:
		emit_signal("caught",body)
	elif body.is_in_group("Cookies"):
		aware = false
		body.queue_free()
		$Timer.start()
		pause()
		


func pause():
	$Animation.stop(false)


func _on_pass():
	pass
	
func unpause():
	$Animation.play("MoveGuard")

func reset():
	$Animation.stop(true)
	$Animation.play("MoveGuard")
	



func _on_Timer_timeout():
	aware = true
	unpause()
