extends "res://Character.gd"

# Called every frame. 'delta' is the elapsed time since the previous frame.


var ab_name_1 = "Push"
var ab_name_2 = "Grill"

func action_1():
	print("Press button")
	for a in $ActionArea.get_overlapping_areas():
		if a.is_in_group("Button"):
			a.press()
			return true
	return false

func action_2():
	for a in $ActionArea.get_overlapping_areas():
		if a.is_in_group("Grill"):
			a.start_grill()
			return true

	
	return false
