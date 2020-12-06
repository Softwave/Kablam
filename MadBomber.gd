extends Area2D

var can_move = true 
var rand_pos = 0.0
var move_speed = 0.5
var velocity = Vector2()
var moving_left = false
var moving_right = false 
var bomb_speed = 50



export var max_speed = 5


func rand_position():
	#print("rand position called")
	randomize()
	rand_pos = rand_range(10, 230)

func _ready():
	can_move = true
	rand_position()
	

	
func move_right(delta):
	moving_left = false
	moving_right = true
	position.x += move_speed


		
func move_left(delta):
	moving_right = false
	moving_left = true 
	position.x -= move_speed
	

func drop_bomb():
	var projectile = load("res://BombScene.tscn")
	var bomb = projectile.instance()
	owner.add_child(bomb)
	bomb.transform = global_transform
	get_tree().call_group("bombs", "connect")
	#add_child_below_node(get_tree().get_root().get_node("."), bomb)

	

func _process(delta):
	if !(get_node("../Player/Paddle3").get("is_paused")):
		#print(position.x)
		#print(rand_pos)
		if (position.x < rand_pos):
			#print("We are left")
			if (moving_left):
				rand_position()
			move_right(delta)
		elif (position.x > rand_pos):
			#print("We are right of it")
			if (moving_right):
				rand_position()
			move_left(delta)
		else:
			#print("We are equal")
			move_left(delta)
		position += velocity * delta
		
		# Base the bombers speed on the score of the player 
		var tmp_player_score = Globals.global_player_score
		if (tmp_player_score < 5):
			move_speed = 0.5
			print("level 1")
		elif (tmp_player_score >= 5 and tmp_player_score < 10):
			move_speed = 0.75
			bomb_speed = 55
			print("level 2")
		elif(tmp_player_score >= 10 and tmp_player_score < 20):
			move_speed = 1
			bomb_speed = 60
			print("level 3")
		elif (tmp_player_score >= 20 and tmp_player_score < 30):
			move_speed = 1.5
			bomb_speed = 75
		elif (tmp_player_score >= 30 and tmp_player_score < 40):
			move_speed = 2
			bomb_speed = 80
		elif (tmp_player_score >= 40 and tmp_player_score < 50):
			move_speed = 3
			bomb_speed = 100
		elif (tmp_player_score >= 50 and tmp_player_score < 60):
			move_speed = 4
			bomb_speed = 120
		elif (tmp_player_score >= 60 and tmp_player_score < 70):
			move_speed = 5
			bomb_speed = 140
		else:
			move_speed = 5
			bomb_speed = 150
			print("level last")
			
		# Also 
		var bombs = get_tree().get_nodes_in_group("bombs")
		for bomb in bombs:
			bomb.bomb_speed = bomb_speed
			
	#var enemies = get_tree().get_nodes_in_group("bombs")
	#for enemy in enemies:
	#	enemy.queue_free()
			

		
		
	if Input.is_action_just_pressed("test_fire"):
		drop_bomb()

		


func _on_Timer_timeout():
	drop_bomb()
