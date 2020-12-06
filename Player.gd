extends Node2D

var player_score = 0
var player_paddles = 3 
var player_level = 1 

func _ready():
	pass
	
	
func _process(delta):
	pass


func score_points():
	player_score += 1
	get_node("../ScoreLabel").text = "Score: " + str(player_score)

func enemy_scored():
	print("Enemy scored")
	get_node("BoomPlay").play()
	
	if (get_node_or_null("Paddle1")):
		player_paddles = 2
		get_node("Paddle1").queue_free()
	elif (get_node_or_null("Paddle2")):
		player_paddles = 1
		get_node("Paddle2").queue_free()
	else:
		print("Game Over")
	
#	if (player_paddles == 3):
#		get_node("Paddle1").queue_free()
#		player_paddles = 2
#
#	if (player_paddles == 2):
#		get_node("Paddle2").queue_free()
#		#player_paddles = 1
#
#	if (player_paddles == 1):
#		print("Game over")
