extends Spatial


export(float) var movespeed = 10
signal caught

var aware = true
# Called when the node enters the scene tree for the first time.
func _ready():
	reset()


func _on_Guard_body_entered(body):
	if body.is_in_group("Player") and aware:
		emit_signal("caught",body,name)
		

func _on_Guard_area_entered(area):
	if area.is_in_group("Cookie"):
		$AnimationPlayer.play("Fall")
		aware = false
		area.queue_free()
		$Timer.start()
		pause()
		
func pause():
	$Animation.stop(false)
	aware = false
	
func unpause():
	aware = true
	$Animation.play("MoveGuard")

func reset():
	$AnimationPlayer.seek(0,true)
	aware = true
	$Animation.stop(true)
	$Animation.play("MoveGuard")

func _on_Timer_timeout():
	$AnimationPlayer.play("Stand")
	$AnimationPlayer.queue("walk (copy)")
	aware = true
	unpause()


