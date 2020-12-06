extends KinematicBody2D

var velocity = Vector2()

func _ready():
	velocity.y = 60

func _physics_process(delta):
	move_and_slide(velocity)

func _on_area_entered(area):
	if area.name == "Paddle1":
		print("boomb")
