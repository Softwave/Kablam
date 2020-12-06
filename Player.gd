extends Node2D

var player_score = 0
var player_paddles = 3 
var player_level = 1 

var score_modifier = 20

func _ready():
	pass
	
	
func _process(delta):
	pass


func score_points():
	Globals.global_player_score += 1
	get_node("../ScoreLabel").text = "Score: " + str(Globals.global_player_score)
	
	# Give us a new paddle if we get to a certain score 
	# if we are a multiple of 10 and only paddle one is down 
	if ((Globals.global_player_score % score_modifier == 0) and (!get_node_or_null("Paddle1").visible) and (get_node_or_null("Paddle2").visible)):
		get_node("Paddle1").set_collision_layer_bit(0, true)
		get_node("Paddle1").visible = true
		get_node("PowerupPlay").play()
	
	if ((Globals.global_player_score % score_modifier == 0) and (!get_node_or_null("Paddle2").visible)):
		get_node("Paddle2").set_collision_layer_bit(0, true)
		get_node("Paddle2").visible = true
		get_node("PowerupPlay").play()
	
#	if (get_node_or_null("Paddle1")):
#		player_paddles = 2
#		get_node("Paddle1").queue_free()
#	elif (get_node_or_null("Paddle2")):
#		player_paddles = 1
#		get_node("Paddle2").queue_free()
#	else:
#		print("Game Over")
	
	
	
#func drop_bomb():
#	var projectile = load("res://BombScene.tscn")
#	var bomb = projectile.instance()
#	owner.add_child(bomb)
#	bomb.transform = global_transform
#	get_tree().call_group("bombs", "connect")
#	#add_child_below_node(get_tree().get_root().get_node("."), bomb)

	

func enemy_scored():
	print("Enemy scored")
	get_node("BoomPlay").play()
	get_node("../MadBomber/Timer").stop()
	
	if (get_node_or_null("Paddle1").visible):
		player_paddles = 2
		get_node("Paddle1").set_collision_layer_bit(0, false)
		get_node("Paddle1").visible = false 
		#get_node("Paddle1").queue_free()
	elif (get_node_or_null("Paddle2").visible):
		player_paddles = 1
		get_node("Paddle2").set_collision_layer_bit(0, false)
		get_node("Paddle2").visible = false 
	else:
		print("Game Over")
		get_tree().change_scene("res://scenes/test_gameover.tscn")
		
	# Now we pause the game 
	get_node("../GameStatusLabel").text = "Press Space"
	get_node("Paddle3").is_paused = true
	
	# Delete all the bombs 
	var enemies = get_tree().get_nodes_in_group("bombs")
	for enemy in enemies:
		enemy.queue_free()
	
# "."".."
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
