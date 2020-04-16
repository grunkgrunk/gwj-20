extends Control



var curr = 0

var new = false

var selection = null
export(Array,PackedScene) var characters

onready var nchars = len(characters)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


	
func _input(event):
	if(event.is_action_pressed("ui_up")):
		new = true
		curr += 1
	if(event.is_action_pressed("ui_down")):
		new = true
		curr -= 1
		
	if new:
		curr = max(min(curr,nchars-1),0)
		draw_character(curr)
		new = false
	
	
func draw_character(num):
	if selection:
		selection.queue_free()
	selection = characters[num].instance()
	self.add_child(selection)
	
	
