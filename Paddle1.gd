extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass



func _on_Paddle1_area_entered(area):
	get_node("../ScorePlay").play()
	get_node("..").score_points()
	#$ScorePlay.play()
	# Make explosion 
	var bomb_scene = load("res://BombParticles.tscn")
	var bomb_particles = bomb_scene.instance()
	owner.add_child(bomb_particles)
	bomb_particles.transform = global_transform
	 
	area.queue_free()
