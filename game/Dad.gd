extends KinematicBody2D

var movespeed = 100

onready var actions = $Actions

var start_pos = Vector2()

# Called when the node enters the scene tree for the first time.
func _ready():
	actions.connect("action_activated", self, "act")
	start_pos = position

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var m = actions.move_direction()
	move_and_collide(m * movespeed*delta)

func act(evt):
	if not evt.type == "pressed":
		return
	if evt.action == "action_1":
		action_1()
	if evt.action == "action_2":
		action_2()

func action_1():
	print("dad humor")

func action_2():
	print("grill expert")

func reset():
	position = start_pos
	actions.reset()


func pause():
	actions.pause()

func choose():
	actions.is_player_in_control = true

