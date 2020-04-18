extends Area

signal caught

func _ready():
	connect("body_entered", self, "b")
	$Animation.connect("animation_finished", self, "anim_end")


func b(body):
	if body.is_in_group("Player") and !$Animation.is_playing():
		emit_signal("caught",body,name)
		


func go_to_grill():
	$Animation.play("MoveToGrill")

func return_to_rest():
	$Animation.play("ReturnToRest")

func anim_end(name):
	if name == "MoveToGrill":
		$Animation.play("ReturnToRest")

func reset():
	$Animation.play("MoveToGrill")
	$Animation.seek(0,true)
	$Animation.stop(true)
