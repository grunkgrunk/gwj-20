extends Area

export(NodePath) var doorpath
onready var door = get_node(doorpath)

func _ready():
	$Sprite.frame = 0

func hack():
	print("Has been hacked")
	$Timer.start()
	door.open()
	$Sprite.frame = 1
	



func _on_Timer_timeout():
	door.close()
	$Sprite.frame = 0


func _input(event):
	if event.is_action_pressed("ui_accept"):
		hack()
