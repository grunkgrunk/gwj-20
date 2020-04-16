extends Control



var curr = 0

var new = false

var selection = null

onready var avatars = $HBoxContainer/VBoxContainer.get_children()
onready var stats = $HBoxContainer/Stats.get_children()

func _ready():
	print(stats)

func _input(event):
	# DO ONLY ONCE PER CLICK
	var up = event.is_action_pressed("ui_up") 
	var down = event.is_action_pressed("ui_down") 
	if up or down:
		hide_info(avatars[curr])
		if up:
			curr += 1
		if down:
			curr -= 1

		curr = curr % len(avatars)		
		show_info(avatars[curr])
	
	
func show_info(avatar):
	var s = avatar.stats
	avatar.on_select()
	s.show()

func hide_info(avatar):
	avatar.stats.hide()
	avatar.on_deselect()
	
	
