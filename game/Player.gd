extends KinematicBody2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


var is_player_in_control = true
var record = []
var current_time = 0
var important_buttons = ["ui_up", "ui_down", "ui_left", "ui_right", "action_1", "action_2"]
var movespeed = 1000
var virtual_keyboard = {}

onready var start_pos = position

func mk_keyboard():
 return {
	"ui_up": false,
	"ui_down": false,
	"ui_left": false,
	"ui_right": false,
	"action_1": false,
	"action_2": false
}

func toggle():
	current_time = 0
	position = start_pos
	virtual_keyboard = mk_keyboard()
	is_player_in_control = !is_player_in_control

# Called when the node enters the scene tree for the first time.
func _ready():
	virtual_keyboard = mk_keyboard()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	current_time += delta
	
	if Input.is_action_just_pressed("ui_accept"):
		toggle()
	
	
	if is_player_in_control:
		for b in important_buttons:
			if f(b):
				record.append(mk_recording(b, current_time))
	else:
		update_virtual_keyboard(current_time)
	var move = player_move() if is_player_in_control else virtual_move() 
	
	move_and_collide(move*movespeed*delta)
	

func player_move():
	var move = Vector2(0,0)
	if Input.is_action_pressed("ui_up"):
		move.y-=1
	if Input.is_action_pressed("ui_down"):
		move.y+=1
	if Input.is_action_pressed("ui_left"):
		move.x-=1
	if Input.is_action_pressed("ui_right"):
		move.x+=1
	
	return move.normalized()

func update_virtual_keyboard(current_time):
	for evt in record:
		if evt.used:
			continue
		if current_time > evt.time:
			evt.used = true
			virtual_keyboard[evt.action] = evt.type == "pressed"

func virtual_move():
	var move = Vector2(0,0)
	if virtual_keyboard["ui_up"]:
		move.y-=1
	if virtual_keyboard["ui_down"]:
		move.y+=1
	if virtual_keyboard["ui_left"]:
		move.x-=1
	if virtual_keyboard["ui_right"]:
		move.x+=1
	
	return move.normalized()
	
func mk_recording(x, current_time):
	 return {
		"time": current_time,
		"action": x,
		"type": f(x),
		"used": false
	}
	

func f(x):
	if Input.is_action_just_pressed(x):
		return "pressed"
	if Input.is_action_just_released(x):
		return "released"
	return false



	
	
	
