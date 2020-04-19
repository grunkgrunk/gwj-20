extends Control

signal next_txt
signal intro_text_done

onready var l = $Label

#var texts = ["A special type of crime has swept the nation.", 
#			"Perfectly coordinated heists are leaving investigators without evidence"
#			,"In all the cases, the perputrators were from a single gang.","They are known as:",
#			"'The Family'","In these woods the familys next elaborately planned hit will take place",
#			"Using a time-machine you can steal the treasure without breaking a sweat",
#			"Good luck in getting the treasure for 'The Family'!"]


var texts = ["The peace in these woods is soon to be broken.",
"An elaborately planned heist will play out at exactly 03:00.",
"Your gang, known only as 'The Family', has acquired a time machine.",
"And you will not be using it for good!"]
func _ready():
	pass

func run_intro():
	show()
	for t in texts:
		l.text = t
		yield(self, "next_txt")
	
	emit_signal("intro_text_done")

func run_tutor():
	l.text = "Press escape to enter time machine!"
	#yield(self, "next_txt")
	#emit_signal("intro_text_done")
	#hide()
	


func _input(event):
	if event.is_action_pressed("ui_accept"):
		emit_signal("next_txt")


