extends KinematicBody2D


onready var actions = $Actions

# Called when the node enters the scene tree for the first time.
func _ready():
	actions.connect("action_activated", self, "act")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var m = actions.move_direction()
	move_and_collide(m * delta)

func act(evt):
	if not evt.type == "pressed":
		return
	if evt.action == "action_1":
		action_1()
	if evt.action == "action_2":
		action_2()

func action_1():
	print("distracted guards with cookies")

func action_2():
	print("hit guard with handbag")



	
	
