extends KinematicBody2D

var movespeed = 100

var start_pos = Vector2()

onready var actions = $Actions

# Called when the node enters the scene tree for the first time.
func _ready():
	actions.connect("action_activated", self, "act")
	start_pos = position


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var m = actions.move_direction()
	move_and_collide(m * movespeed * delta)

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


func choose():
	actions.is_player_in_control = true
	

func reset():
	position = start_pos
	actions.reset()

func pause():
	actions.pause()
