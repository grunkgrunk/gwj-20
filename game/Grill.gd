extends Area

export(NodePath) var doggo
onready var dog = get_node(doggo)

func start_grill():
	$Sausage.show()
	dog.go_to_grill()
	yield(dog.get_node("Animation"), "animation_finished")
	$Sausage.hide()


func reset():
	$Sausage.hide()
