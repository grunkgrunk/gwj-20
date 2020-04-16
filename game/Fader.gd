extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$Label.hide()
	$AnimationPlayer.play("FadeIn")

func show_gameover():
	$AnimationPlayer.play("FadeOut")
	yield($AnimationPlayer, "animation_finished")
	$Label.show()
	
func reset():
	$Label.hide()
	$AnimationPlayer.play("FadeIn")

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
