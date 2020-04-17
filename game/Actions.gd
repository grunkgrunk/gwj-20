extends Node

signal action_activated

var is_player_in_control = false

var record = []
var important_buttons = ["ui_up", "ui_down", "ui_left", "ui_right", "action_1", "action_2"]
var virtual_keyboard = {}

func mk_keyboard():
	return {
		"ui_up": false,
		"ui_down": false,
		"ui_left": false,
		"ui_right": false,
		"action_1": false,
		"action_2": false
	}


func reset():
	virtual_keyboard = mk_keyboard()

	is_player_in_control = false
	for r in record:
		r.used =false


# Called when the node enters the scene tree for the first time.
func _ready():
	virtual_keyboard = mk_keyboard()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if G.paused:
		return
	update()
	# DEBUG
	#if Input.is_action_just_pressed("ui_accept"):
	#	toggle()

func move_direction():
	if G.paused:
		return Vector3()
	var move = player_move() if is_player_in_control else virtual_move() 
	return move

func update():
	if is_player_in_control:
		for b in important_buttons:
			var action_type = f(b) 
			if action_type:
				var r = mk_recording(b)
				record.append(r)
				emit_signal("action_activated", r)
	else:
		update_virtual_keyboard()

func player_move():
	var move = Vector3()
	if Input.is_action_pressed("ui_up"):
		move.z-=1
	if Input.is_action_pressed("ui_down"):
		move.z+=1
	if Input.is_action_pressed("ui_left"):
		move.x-=1
	if Input.is_action_pressed("ui_right"):
		move.x+=1
	
	return move.normalized()

func update_virtual_keyboard():
	var all_used = true
	for evt in record:
		if evt.used:
			continue
		all_used = false
		if G.current_time > evt.time:
			evt.used = true
			emit_signal("action_activated", evt)
			virtual_keyboard[evt.action] = evt.type == "pressed"
				
	
	if all_used:
		virtual_keyboard = mk_keyboard()

	


func virtual_move():
	var move = Vector3()
	if virtual_keyboard["ui_up"]:
		move.z-=1
	if virtual_keyboard["ui_down"]:
		move.z+=1
	if virtual_keyboard["ui_left"]:
		move.x-=1
	if virtual_keyboard["ui_right"]:
		move.x+=1
	
	return move.normalized()
	
func mk_recording(x):
	 return {
		"time": G.current_time,
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



	
	
	
