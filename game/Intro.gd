extends Control

signal next_txt
signal intro_text_done

onready var l = $Label

var texts = ["", "You are driving", "You are about to play a fun game", "good luck"]

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


