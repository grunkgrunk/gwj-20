extends Camera

export(NodePath) var inital_target_path
onready var itp = get_node(inital_target_path)

var target = null
var offset = Vector3(0, 7, -8)
var start_pos = Vector3()

var current_pos = null

func _ready():
	start_pos = transform.origin
	offset = transform.origin - itp.global_transform.origin 
	# current_pos = 

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if target:
		transform.origin = transform.origin.linear_interpolate(target.global_transform.origin + offset, 0.1)

func hard_set():
	transform.origin = target.global_transform.origin + offset
	

func setup_intro():
	$Tween.interpolate_property(self, "translation", transform.origin + Vector3(0,0,300), transform.origin, 4)
	transform.origin = transform.origin + Vector3(0,0,300)

func move_to_familiy():
	$Tween.start()
