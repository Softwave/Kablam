extends Area2D

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
		if(get_node_or_null("../Paddle1")):
			get_node_or_null("../Paddle1").position.x = get_global_mouse_position().x / 4 - 120
			get_node_or_null("../Paddle1").position.x = clamp(position.x, -100, 100)
		
		if (get_node_or_null("../Paddle2")):
			get_node_or_null("../Paddle2").position.x = get_global_mouse_position().x / 4 - 120
			get_node_or_null("../Paddle2").position.x = clamp(position.x, -100, 100)
	



func _on_Paddle3_area_entered(area):
	print("Paddle 3 hit")
	get_node("../ScorePlay").play()
	get_node("..").score_points()
	area.queue_free()
