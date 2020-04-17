extends VBoxContainer


var colors = [Color("#5b6ee1"), Color("#df7126"), Color("#ac3232"), Color("#99e550"), Color("#76428a")]
var offset = randi() % len(colors)

func _ready():
	var i = 0
	for a in get_children():
		if a.has_method("set_color"):
			i += 1	
			a.set_color(colors[(i + offset) % len(colors)])
