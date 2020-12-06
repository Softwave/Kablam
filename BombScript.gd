extends Area2D 

var bomb_speed = 50 

func _physics_process(delta):
	position += transform.y * bomb_speed * delta
