extends Spatial

signal clicked_retry
signal pressed_character_select

export(NodePath) var granny_path
export(NodePath) var dad_path
export(NodePath) var boy_path

var is_gameover = false
var in_intro = false

var death_reasons = {
	"Dog": "You where killed by doggoo",
	"Guard": "The guard spotttet you and he shot you. Maybe give him a cookie?",
	"SecurityCam": "You got spottet by a camera",
	"Laser": "You were burnt by very warm laser."
}

onready var mapping = {
	"Granny": get_node(granny_path),
	"Dad": get_node(dad_path),
	"Boy": get_node(boy_path)
}

# Called when the node enters the scene tree for the first time.
onready var ch_select = $ui/CharacterSelection

func start_from_intro():
	in_intro = true
	$ui/Clock.hide()
	$ui/Abilities.hide()
	$Camera.setup_intro()
	$ui/Intro.run_intro()
	yield($ui/Intro, "intro_text_done")
	$ui/Intro.hide()
	$Camera.move_to_familiy()
	yield($Camera/Tween, "tween_completed")
	$ui/Intro.show()
	$ui/Intro.run_tutor()
	yield(self, "pressed_character_select")
	$ui/Intro.hide()
	in_intro = false
	show_character_select()

func _ready():
	reset()
	ch_select.hide()
	ch_select.connect("avatar_chosen", self, "on_avatar_chosen")
	for p in get_tree().get_nodes_in_group("Player"):
		p.connect("used_ability", self, "_on_used_ability")
	
	for g in get_tree().get_nodes_in_group("Killer"):
		g.connect("caught",self,"on_caught")
	
	$ui/Intro.hide()
	start_from_intro()

func _on_used_ability(n, success, in_control):
	if in_control:
		$ui/Abilities.use(n, success)

func show_character_select():
	ch_select.show()
	$ui/Abilities.hide()
	$ui/Clock.hide()
func get_actors():
	return get_tree().get_nodes_in_group("Actor")

func _input(e):
	if in_intro:
		if e.is_action_pressed("character_select"):
			emit_signal("pressed_character_select")

		return

	if e.is_action_pressed("character_select") and not is_gameover:
		if ch_select.is_visible():
			ch_select.hide()
			unpause()
			$ui/Abilities.show()
			$ui/Clock.show()
		else:
			show_character_select()
			pause()
	
	if e.is_action_pressed("ui_accept") and is_gameover:
		emit_signal("clicked_retry")


func pause():
	G.paused = true
	for a in get_actors():
		if a.has_method("pause"):
			a.pause()


func unpause():
	G.paused = false
	for a in get_actors():
		if a.has_method("unpause"):
			a.unpause()


func reset():
	$ui/Abilities.reset()
	$ui/GameOver.hide()
	G.current_time = 0
	for a in get_actors():
		a.reset()

func gameover(killer_name):
	is_gameover = true
	pause()
	$ui/Fader.fade_out()
	yield($ui/Fader/AnimationPlayer, "animation_finished")
	$ui/GameOver.show()
	$ui/GameOver/Reason.text = death_reasons[killer_name]

	
	
func choose_character(c):
	reset()
	unpause()
	c.actions.is_player_in_control = true
	c.actions.record = []
	
	$ui/Abilities/C/Ability.text = c.ab_name_1
	$ui/Abilities/V/Ability.text = c.ab_name_2
	$ui/Abilities.show()
	$ui/Fader.reset()
	$Camera.target = c
	$Camera.hard_set()

func on_avatar_chosen(avatar_name):
	var c = mapping[avatar_name] 
	choose_character(c)
	ch_select.hide()
	
func on_caught(body,name):
	gameover(name)
	yield(self, "clicked_retry")
	is_gameover = false
	$ui/Fader.fade_in()
	$ui/GameOver.hide()
	choose_character(body)
	unpause()

