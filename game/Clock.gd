extends Label

func _process(_delta):
	var b = str(int(floor(G.current_time))%60)
	if len(b)==1:
		b = "0"+b
	text = "0"+str(floor(G.current_time/60+3))+":"+b
