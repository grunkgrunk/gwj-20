tool
extends Control

export(String) var stat_name = ""
export(float) var stat_value = 0

func setup():
	$HBoxContainer/Label.text = stat_name
	$HBoxContainer/ProgressBar.value = stat_value
	
func _ready():
	setup()

func _process(delta):
	if Engine.editor_hint:
		setup()
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
