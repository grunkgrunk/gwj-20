extends Area

var is_taken = false

func _ready():
	reset()

func reset():
	is_taken = false
	$Sprite3D.show()

func take():
	is_taken = true
	$Sprite3D.hide()


