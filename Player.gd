extends Node2D

var player_score = 0
var player_paddles = 3 
var player_level = 1 

func _ready():
	pass

func score_points():
	player_score += 1
	get_node("../ScoreLabel").text = "Score: " + str(player_score)

func enemy_scored():
	print("Enemy scored")
	get_node("BoomPlay").play()
