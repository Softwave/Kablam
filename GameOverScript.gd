extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$EndScore.text = "Final Score: " + str(Globals.global_player_score)

func _input(event):
	if Input.is_action_pressed("ui_cancel"):
		get_tree().quit()
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
