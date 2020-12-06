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





func _on_Paddle2_area_entered(area):
	print("Paddle 2 hit")
	get_node("../ScorePlay").play()
	get_node("..").score_points()
	area.queue_free()
