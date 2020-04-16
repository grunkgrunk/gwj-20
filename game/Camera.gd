extends Camera

export(NodePath) var inital_target_path
onready var itp = get_node(inital_target_path)

var target = null
var offset = Vector3(0, 7, -8)

var current_pos = null

func _ready():
	offset = transform.origin - itp.global_transform.origin 
	# current_pos = 

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if target:
		transform.origin = transform.origin.linear_interpolate(target.global_transform.origin + offset, 0.1)
