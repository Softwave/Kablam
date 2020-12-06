extends Area2D 


onready var bomb_speed = 50

func _ready():
	#bomb_speed = get_node("/root/RootNode/MadBomber").bomb_speed
	pass

func _physics_process(delta):
	position += transform.y * bomb_speed * delta

func _on_paddle_body_enter(body):
	print("Collision")
	if (body.get_name() == "Paddle3"):
		print("We hit")
