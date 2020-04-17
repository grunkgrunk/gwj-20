tool
extends Control

export(String) var avatar_name = ""
export(NodePath) var path_to_stats = ""
onready var stats = get_node(path_to_stats) 


# Called when the node enters the scene tree for the first time.
func _ready():
	$Label.text = avatar_name


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Engine.editor_hint:
		$Label.text = avatar_name



func on_select():
	$Label.text += "!"
	$AnimationPlayer.play("Hover")

func on_deselect():
	$AnimationPlayer.play("UnHover")
	

