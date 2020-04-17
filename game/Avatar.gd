extends Control

export(String) var avatar_name = ""
export(NodePath) var path_to_stats = ""
onready var stats = get_node(path_to_stats) 


# Called when the node enters the scene tree for the first time.
func _ready():
	$Sprite/Label.text = avatar_name


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
	#if Engine.editor_hint:
	#	$Sprite/Label.text = avatar_name

func on_select(mute):
	$AnimationPlayer.play("Hover")
	$Sprite.z_index = 1000
	if not mute:
		$click.play()

func on_deselect():
	$AnimationPlayer.play("UnHover")
	$Sprite.z_index = 0
	

func say():
	$say.play()