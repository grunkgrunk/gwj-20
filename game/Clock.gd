extends Label

func _process(_delta):
	text = str(floor(G.current_time))
