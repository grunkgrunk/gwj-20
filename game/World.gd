extends Spatial

export(NodePath) var granny_path
export(NodePath) var dad_path

onready var mapping = {
	"Granny": get_node(granny_path),
	"Dad": get_node(dad_path)
}


# Called when the node enters the scene tree for the first time.
onready var ch_select = $ui/CharacterSelection

func _ready():
	ch_select.hide()
	ch_select.connect("avatar_chosen", self, "on_avatar_chosen")
	
	for g in get_tree().get_nodes_in_group("Guard"):
		g.connect("caught",self,"on_caught")

func get_actors():
	return get_tree().get_nodes_in_group("Actor")

func _input(e):
	if e.is_action_pressed("character_select"):
		if ch_select.is_visible():
			ch_select.hide()
			unpause()
		else:
			ch_select.show() 
			pause()


func pause():
	G.paused = true


func unpause():
	G.paused = false



func reset():
	G.current_time = 0
	for a in get_actors():
		a.reset()

func choose_character(c):
	reset()
	unpause()
	c.actions.is_player_in_control = true
	c.actions.record = []

	#$Camera2D.smoothing_enabled = false 
	# $Camera3D.position =  c.global_position
	#$Camera2D.smoothing_enabled = true

	$Camera.target = c

func on_avatar_chosen(avatar_name):
	var c = mapping[avatar_name] 
	choose_character(c)
	ch_select.hide()
	
func on_caught(body):
	choose_character(body)

