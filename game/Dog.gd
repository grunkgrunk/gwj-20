extends Area



func _ready():
	connect("body_entered", self, "b")


func b(body):
	if body.is_in_group("Player") and !$Animation.is_playing():
		catch()
		


func go_to_grill():
	$Animation.play("MoveToGrill")

func _on_Animation_animation_finished(name):
	for b in get_overlapping_bodies():
		if b.is_in_group("Player"):
			catch()

func catch():
	print("You lost")

func reset():
	$Animation.stop()
