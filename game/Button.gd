extends Area

export(NodePath) var laserpath
onready var laser = get_node(laserpath)

func _ready():
	$Sprite.frame = 0

func press():
	print("Has been pressed")
	laser.start()
	$Sprite.frame = 1


func reset():
	$Sprite.frame = 0
	
