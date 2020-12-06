extends Area2D

var player_score = 0
var player_paddles = 3 
var is_paused = true 

func _ready():
	pass
	
func _get_input(delta):
	if (Input.is_action_just_pressed("key_unpause")):
		if (is_paused):
			is_paused = false
			get_node("../../GameStatusLabel").text = ""
	
func _process(delta):
	_get_input(delta)
	if (!is_paused):
		position.x = get_global_mouse_position().x / 4 - 120
		position.x = clamp(position.x, -100, 100)
		get_node("../Paddle1").position.x = get_global_mouse_position().x / 4 - 120
		get_node("../Paddle1").position.x = clamp(position.x, -100, 100)
		get_node("../Paddle2").position.x = get_global_mouse_position().x / 4 - 120
		get_node("../Paddle2").position.x = clamp(position.x, -100, 100)
	
