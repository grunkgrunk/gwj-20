extends Control

signal next_txt

onready var l = $Label

var texts = ["This is an intro", "You are driving", "You are about to play a fun game", "good luck"]

func _ready():
	intro()

func intro():
	for t in texts:
		l.text = t
		yield(self, "next_txt")


func _input(event):
	if event.is_action_pressed("ui_accept"):
		emit_signal("next_txt")
		print("kjsdhf")
