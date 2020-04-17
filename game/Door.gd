extends Position3D


func open():
	$Animation.play("OpenDoor")
	
func close():
	$Animation.play("CloseDoor")

func reset():
	$Animation.play("CloseDoor")
	$Animation.stop()
