extends Spatial

func _ready():

	for a in get_children():
		if a.get_script().has_script_signal("object_spawned"):
			a.connect("object_spawned", self, "spawn_object")

func spawn_object(o):
	print("spawned it")
	add_child(o)
