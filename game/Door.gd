extends Position3D


func open():
	$Animation.play("OpenDoor")
	
func close():
	$Animation.play("CloseDoor")
