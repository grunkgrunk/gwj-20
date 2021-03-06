extends Control

signal avatar_chosen

var curr = 0

var new = false

var selection = null

onready var avatars = $HBoxContainer/VBoxContainer.get_children()
onready var stats = $HBoxContainer/Stats.get_children()

func _ready():
	for s in stats:
		s.hide()
	show_info(avatars[curr], true)
	

func _input(event):
	if not is_visible():
		return
	# DO ONLY ONCE PER CLICK
	var up = event.is_action_pressed("ui_up") 
	var down = event.is_action_pressed("ui_down") 
	if up or down:
		hide_info(avatars[curr])
		if up:
			curr -= 1
		if down:
			curr += 1

		curr = curr % len(avatars)		
		show_info(avatars[curr])
	
	if event.is_action_pressed("ui_accept"):
		emit_signal("avatar_chosen", avatars[curr].avatar_name)
		avatars[curr].say()
	
	
	
func show_info(avatar, mute=false):
	var s = avatar.stats
	avatar.on_select(mute)
	s.show()

func hide_info(avatar):
	avatar.stats.hide()
	avatar.on_deselect()
	
	
