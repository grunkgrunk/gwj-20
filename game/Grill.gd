extends Area

export(NodePath) var doggo
onready var dog = get_node(doggo)

func start_grill():
	print("shoud woof")
	dog.go_to_grill()

func reset():
	pass
