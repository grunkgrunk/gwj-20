extends Area

signal caught

func _ready():
	connect("body_entered", self, "b")
	$Animation.connect("animation_finished", self, "anim_end")


func b(body):
	if body.is_in_group("Player") and !$Animation.is_playing():
		emit_signal("caught",body,name)
		catch()
		


func go_to_grill():
	$Animation.play("MoveToGrill")

func return_to_rest():
	$Animation.play("ReturnToRest", true)

func anim_end(name):
	if name == "ReturnToRest":
		for b in get_overlapping_bodies():
			if b.is_in_group("Player"):
				catch()
	
	else:
		$Animation.play("ReturnToRest")

func catch():
	
	print("You lost")

func reset():
	print("Omg i should reset")
	$Animation.play("MoveToGrill")
	$Animation.seek(0,false)
	$Animation.stop(true)
