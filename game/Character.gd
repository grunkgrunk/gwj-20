extends KinematicBody

signal used_ability

var movespeed = 10

onready var actions = $Actions

var start_pos = Vector3()

var action_1_used = false
var action_2_used = false

onready var anim = $Animation

# Called when the node enters the scene tree for the first time.
func _ready():
	actions.connect("action_activated", self, "act")
	start_pos = transform.origin

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var m = actions.move_direction()
	if m != Vector3():
		var cur = Quat(transform.basis)
		var target = Quat(Vector3(0,atan2(-m.z, m.x) - PI / 2,0))
		var smooth = cur.slerp(target, 0.2)
		transform.basis = Basis(smooth)
	#rotation.y = slerp(rotation.y, atan2(-m.z, m.x) - PI / 2, 0.5)

	if m.length()>0:
		if not anim.is_playing():
			anim.play("walk")
	move_and_collide(m * movespeed * delta)

func act(evt):
	if not evt.type == "pressed":
		return
	if evt.action == "action_1" and not action_1_used:
		action_1_used = action_1()
		emit_signal("used_ability", 1, action_1_used)
	if evt.action == "action_2" and not action_2_used:
		action_2_used = action_2()
		emit_signal("used_ability", 2, action_2_used)
		
func action_1():
	print("dad humor")

func action_2():
	print("grill expert")

func reset():
	transform.origin = start_pos
	actions.reset()
	action_1_used = false
	action_2_used = false

