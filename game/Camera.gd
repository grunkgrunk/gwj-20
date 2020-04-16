extends Camera

export(NodePath) var inital_target_path
onready var itp = get_node(inital_target_path)

var target = null
var offset = Vector3(0, 7, -8)

func _ready():
	offset = itp.global_transform.origin - transform.origin


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if target:
		transform.origin = target.global_transform.origin - offset
