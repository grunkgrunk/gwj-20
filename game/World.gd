extends Spatial

signal clicked_retry

export(NodePath) var granny_path
export(NodePath) var dad_path
export(NodePath) var boy_path

onready var mapping = {
	"Granny": get_node(granny_path),
	"Dad": get_node(dad_path),
	"Boy": get_node(boy_path)
}


# Called when the node enters the scene tree for the first time.
onready var ch_select = $ui/CharacterSelection



func _ready():
	ch_select.hide()
	ch_select.connect("avatar_chosen", self, "on_avatar_chosen")
	
	for p in get_tree().get_nodes_in_group("Player"):
		p.connect("used_ability", self, "_on_used_ability")
	
	for g in get_tree().get_nodes_in_group("Guard"):
		g.connect("caught",self,"on_caught")
	for g in get_tree().get_nodes_in_group("SecurityCam"):
		g.connect("caught",self,"caught_on_cam")

func caught_on_cam(body):
	on_caught(body)

func _on_used_ability(n, success):
	$ui/Abilities.use(n, success)
	

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
	
	if e.is_action_pressed("ui_accept"):
		emit_signal("clicked_retry")


func pause():
	G.paused = true


func unpause():
	G.paused = false


func reset():
	$ui/Abilities.reset()
	G.current_time = 0
	for a in get_actors():
		a.reset()

func gameover():
	$ui/Fader.show_gameover()
	yield(self, "clicked_retry")
	
func choose_character(c):
	reset()
	unpause()
	c.actions.is_player_in_control = true
	c.actions.record = []
	
	$ui/Abilities/C/Ability.text = c.ab_name_1
	$ui/Abilities/V/Ability.text = c.ab_name_2
	$ui/Fader.reset()
	$Camera.target = c

func on_avatar_chosen(avatar_name):
	var c = mapping[avatar_name] 
	choose_character(c)
	ch_select.hide()
	
func on_caught(body):
	gameover()
	choose_character(body)

