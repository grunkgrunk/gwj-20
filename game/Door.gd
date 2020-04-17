extends Position3D


func open():
	$Animation.play("OpenDoor")
	
func close():
	$Animation.play("CloseDoor")

func reset():
	$Animation.play("OpenDoor")
	$Animation.seek(0,true)
	$Animation.stop()
