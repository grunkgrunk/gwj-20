extends Spatial


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer.play("Sway")
	$AnimationPlayer.advance(rand_range(0,100))
	rotate_y(rand_range(0,1000))
	var s = rand_range(0.6,1)
	scale_object_local(Vector3(s,s,s))

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
