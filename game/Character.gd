extends KinematicBody2D

var movespeed = 100

onready var actions = $Actions

var start_pos = Vector2()

var action_1_used = false
var action_2_used = false

onready var anim = $Animation

# Called when the node enters the scene tree for the first time.
func _ready():
	actions.connect("action_activated", self, "act")
	start_pos = position

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var m = actions.move_direction()
	if m.length()>0:
		if not anim.is_playing():
			anim.play("walk")
	move_and_collide(m * movespeed*delta)

func act(evt):
	if not evt.type == "pressed":
		return
	if evt.action == "action_1" and not action_1_used:
		action_1_used = true
		action_1()
	if evt.action == "action_2" and not action_2_used:
		action_2_used = true
		action_2()

func action_1():
	print("dad humor")

func action_2():
	print("grill expert")

func reset():
	position = start_pos
	actions.reset()

