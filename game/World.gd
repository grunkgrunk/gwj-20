extends Node2D

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
	for a in get_actors():
		a.pause()

func unpause():
	for a in get_actors():
		a.unpause()


func reset():
	for a in get_actors():
		a.reset()

func on_avatar_chosen(avatar_name):
	reset()
	unpause()
	mapping[avatar_name].actions.is_player_in_control = true
	mapping[avatar_name].actions.record = []

	ch_select.hide()
	
func on_caught(body):
	reset()

