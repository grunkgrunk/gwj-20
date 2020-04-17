extends Control

var spacing = 35


# Called when the node enters the scene tree for the first time.
func _ready():
	var max_stat_name = 0
	for a in $VBoxContainer.get_children():
		if len(a.stat_name) > max_stat_name:
			max_stat_name = len(a.stat_name)
	
	for a in $VBoxContainer.get_children():
		var missing = spacing - len(a.stat_name)
		for _i in range(0, missing):
			a.get_node("HBoxContainer/Label").text += " "
