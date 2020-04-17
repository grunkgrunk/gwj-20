extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	fade_in()

func reset():
	$AnimationPlayer.play("FadeIn")

func fade_out():
	$AnimationPlayer.play("FadeOut")

func fade_in():
	$AnimationPlayer.play("FadeIn")


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
