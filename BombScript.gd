extends Area2D 

var bomb_speed = 50 

func _ready():
	pass

func _physics_process(delta):
	position += transform.y * bomb_speed * delta

func _on_paddle_body_enter(body):
	print("Collision")
	if (body.get_name() == "Paddle3"):
		print("We hit")
